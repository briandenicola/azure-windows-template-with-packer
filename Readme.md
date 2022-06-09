# Overview
A simple configuration to build a Azure Windows Server Core template with SSH configured using Packer.

# Build 2019
* [Trigger GitHub Action](https://github.com/briandenicola/azure-windows-template-with-packer/actions/workflows/workflow.yaml)

# Build 2022
* [Trigger GitHub Action](https://github.com/briandenicola/azure-windows-template-with-packer/actions/workflows/workflow2022.yaml)

# Deploy
* terraform init 
* terraform apply -var "shared_image_subscription_id=c19e7216-928e-4c6a-ad23-cdbc590e7072" -var-file productions.tfvars

# Status
![Packer Build - 2019](https://github.com/briandenicola/azure-windows-template-with-packer/actions/workflows/workflow.yaml/badge.svg)
![Packer Build - 2022](https://github.com/briandenicola/azure-windows-template-with-packer/actions/workflows/workflow2022.yaml/badge.svg)