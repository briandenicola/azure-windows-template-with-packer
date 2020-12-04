variable "location" {
  description = "The Azure Region to deploy the VM"
  default     = "centralus"
}

variable "resource_group_name" {
  description = "The Resource Group name that contains the Vnet for VM"
  default     =  "DevSub02_Client_RG"
}

variable "virtual_network_name" {
  description = "The Vnet name where VM will be deployed to"
}

variable "virtual_network_name_resource_group" {
  description = "The Vnet name where VM will be deployed to"
}

variable "vm_size" {
  description = "The VM node size"
  default     = "Standard_B4ms"
}

variable "admin_user" {
  description = "The local administrator"
  default     = "manager"
}

variable "shared_image_subscription_id" {
  description = "Azure Subscription ID where Shared Resource Gallery is located"
}

variable "image_version" {
  description = "Shared Resource Gallery Image version"
}

variable "image_name" {
  description = "Shared Resource Gallery Image name"
}

variable "gallery_name" {
  description = "Shared Resource Gallery name"
}

variable "gallery_resource_group" {
  description = "Shared Resource Gallery Resource Group name"
}