variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "vscode-terraform-group"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
  default     = "westeurope"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
  default     = "Vscodeterraformsa"
}

variable "count_value" {
  type    = number
  default = 25
}