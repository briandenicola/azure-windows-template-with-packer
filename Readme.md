# Overview
A simple configuration to build a Azure Windows Server Core 2019 template with SSH configured using Packer.

# Build
* .\build_windows_2019_azure.ps1 -SubscriptionId 0ca4429f-4dcc-4b70-8118-3cb6ad856f30 -ClientId 7a21d8-8b56-42a4-abff-8db4833430b4 -TenantId b7498-ba6e-4ffc-b146-9f3fced9f1b7  -ClientSecret $client_secret

# Deploy
* terraform init 
* terraform apply -var "shared_image_subscription_id=c19e7216-928e-4c6a-ad23-cdbc590e7072" -var-file productions.tfvars
