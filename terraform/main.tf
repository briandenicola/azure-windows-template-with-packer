provider "azurerm" {
  version         = "~> 2.38.0"
  features        {}
}

provider "azurerm" {
  alias           = "shared_image"
  version         = "~> 2.38.0"
  subscription_id = var.shared_image_subscription_id
  features        {}
}

resource "random_id" "id" {
  byte_length = 4
}

resource "random_password" "password" {
  length = 25
  special = true
}

data "azurerm_shared_image_version" "bjd_azure_gallery_version" {
  name                = var.image_version
  image_name          = var.image_name 
  gallery_name        = var.gallery_name 
  resource_group_name = var.gallery_resource_group 
  provider            = azurerm.shared_image
}

data "azurerm_subnet" "vm_subnet" {
  name                 = "Servers" 
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.virtual_network_name_resource_group
}

resource "azurerm_resource_group" "client" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_network_interface" "client" {
  name                = "${random_id.id.id}-nic"
  location            = azurerm_resource_group.client.location
  resource_group_name = azurerm_resource_group.client.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "client" {
  name                = "vm-${random_id.id.id}"
  resource_group_name = azurerm_resource_group.client.name
  location            = azurerm_resource_group.client.location
  size                = var.vm_size
  admin_username      = var.admin_user
  admin_password      = random_password.password.result
  network_interface_ids = [
    azurerm_network_interface.client.id,
  ]

  os_disk {
    name                  = "${random_id.id.id}-osdisk" 
    caching               = "ReadWrite"
    storage_account_type  = "Premium_LRS"
  }

  source_image_id     = data.azurerm_shared_image_version.bjd_azure_gallery_version.id

}

output "password" {
  value = random_password.password.result
}

output "ip_address" {
  value = azurerm_network_interface.client.private_ip_address
}
