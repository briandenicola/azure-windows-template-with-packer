# Overview
A simple configuration to build a Azure Windows Server Core 2019 template with SSH configured using Packer.

# Build
* packer build -var "azure_subscription_id=0ca4429f-4dcc-4b70-8118-3cb6ad856f30" -var "azure_client_id=7a21d8-8b56-42a4-abff-8db4833430b4" -var "azure_tenant_id=b7498-ba6e-4ffc-b146-9f3fced9f1b7" -var "azure_client_secret=${{ secrets.ARM_CLIENT_SECRET }}"  windows_server_2019.json 

# Deploy
* terraform init 
* terraform apply -var "shared_image_subscription_id=c19e7216-928e-4c6a-ad23-cdbc590e7072" -var-file productions.tfvars
