output "storage_account_endpoint" {
  value = azurerm_storage_account.sa.primary_blob_endpoint
}

output "virtual_network_address" {
  value = azurerm_virtual_network.vnet.subnet
}