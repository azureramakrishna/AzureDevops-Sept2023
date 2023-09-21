data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "snet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

data "azurerm_key_vault" "keyvault" {
  name                = "vscodekv"
  resource_group_name = "vscode-terraform-group"
}

data "azurerm_key_vault_secret" "vmpassword" {
  name         = "WinVMPassword"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}








