# Terraform Provider Azurerm version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.70.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  client_id       = "14651c27-1aad-4251-b759-b208f67cac4a"
  client_secret   = "qjo8Q~uFvyJQ7ncn2Dx.L_jv4yF0J-Dhy_gAddBg"
  tenant_id       = "459865f1-a8aa-450a-baec-8b47a9e5c904"
  subscription_id = "6e4924ab-b00c-468f-ae01-e5d33e8786f8"
}

# Terraform Backend
terraform {
  backend "azurerm" {
    resource_group_name  = "Cloud-shell-resource-group"
    storage_account_name = "saanvikitcloudshell"
    container_name       = "tfstate"
    key                  = "remotemodule.terraform.tfstate"
  }
}

module "remote-storage" {

  source = "git::https://github.com/azureramakrishna/AzureDevops-Sept2023.git"

  resource_group_name  = "remote-module-resource-group"
  location             = "eastus"
  storage_account_name = "remotemodulesa"
  count_value          = 9
}