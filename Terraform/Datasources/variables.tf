variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "vscode-terraform-group"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
  default     = "Vscodeterraformsa"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
  default     = "vscode-terraform-vnet"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
  default     = "default"
}

variable "public_ip_name" {
  type        = string
  description = "Name of the public ip"
  default     = "vscode-terraform-pip"
}

variable "network_security_group_name" {
  type        = string
  description = "Name of the network security group"
  default     = "vscode-terraform-nsg"
}

variable "network_interface_name" {
  type        = string
  description = "Name of the network interface"
  default     = "vscode-terraform-nic"
}

variable "virtual_machine_name" {
  type        = string
  description = "Name of the virtual machine"
  default     = "vscode-terraform-vm"
}

variable "adminuser" {
  type    = string
  default = "azureuser"
}

