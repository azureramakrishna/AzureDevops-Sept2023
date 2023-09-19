variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "vscode-terraform-rg"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
  default     = "eastus"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
  default     = "Vscodeterraformsa"
}