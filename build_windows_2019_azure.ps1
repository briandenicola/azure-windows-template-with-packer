param(
    [Parameter(Mandatory=$true)]
    [string] $TenantID,

    [Parameter(Mandatory=$true)]
    [string] $SubscriptionID,

    [Parameter(Mandatory=$true)]
    [string] $ClientID,

    [Parameter(Mandatory=$true)]
    [string] $ClientSecret,

    [Parameter(Mandatory=$false)]
    [string] $Location  = "southcentralus"

)

Import-Module -Name bjd.Azure.Functions
Import-Module -Name bjd.Common.Functions

$creds = New-PSCredentials -UserName $ClientID -Password $ClientSecret
Login-AzAccount -ServicePrincipal -Tenant $TenantID -Credential $creds -Subscription $SubscriptionID

$ResourceGroupName = "build_rg-{0}" -f (New-Uuid)

New-AzResourceGroup -Name $ResourceGroupName -Location $Location

packer build -var "azure_subscription_id=$SubscriptionID" -var "azure_client_id=$ClientID" -var "azure_tenant_id=$TenantID" -var "azure_client_secret=$ClientSecret" -var "build_resource_group_name=$ResourceGroupName" windows_server_2019.json

if( Get-AzResourceGroup -Name $ResourceGroupName ) { Remove-AzResourceGroup -Name $ResourceGroupName -Confirm:$false -Force -AsJob | Select-Object -Property Name }