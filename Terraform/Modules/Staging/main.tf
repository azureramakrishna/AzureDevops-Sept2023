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
}

# Terraform Backend
terraform {
  backend "azurerm" {
    resource_group_name  = "Cloud-shell-resource-group"
    storage_account_name = "saanvikitcloudshell"
    container_name       = "tfstate"
    key                  = "stagingmodule.terraform.tfstate"
  }
}

module "staging-vm" {
  source                      = "../VMModule/"
  resource_group_name         = var.staging_rg
  location                    = var.location
  storage_account_name        = var.staging_storage_account
  virtual_network_name        = var.staging_virtual_network
  virtual_network_address     = var.staging_virtual_network_address
  subnet_name                 = var.staging_subnet
  subnet_address              = var.staging_subnet_address
  public_ip_name              = var.staging_pip
  network_security_group_name = var.staging_network_security_group
  network_interface_name      = var.staging_network_interface
  virtual_machine_name        = var.staging_virtual_machine
  adminuser                   = var.staging_adminUser
  adminPassword               = var.staging_adminPasswrod
}