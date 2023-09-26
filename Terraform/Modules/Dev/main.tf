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
    key                  = "devmodule.terraform.tfstate"
  }
}

module "dev-vm" {
  source                      = "../VMModule/"
  resource_group_name         = var.dev_rg
  location                    = var.location
  storage_account_name        = var.dev_storage_account
  virtual_network_name        = var.dev_virtual_network
  virtual_network_address     = var.dev_virtual_network_address
  subnet_name                 = var.dev_subnet
  subnet_address              = var.dev_subnet_address
  public_ip_name              = var.dev_pip
  network_security_group_name = var.dev_network_security_group
  network_interface_name      = var.dev_network_interface
  virtual_machine_name        = var.dev_virtual_machine
  adminuser                   = var.dev_adminUser
  adminPassword               = var.dev_adminPasswrod
}