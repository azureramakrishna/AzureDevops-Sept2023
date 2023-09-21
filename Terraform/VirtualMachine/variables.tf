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

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
  default     = "vscode-terraform-vnet"
}

variable "virtual_network_address" {
  type        = list(any)
  description = "Address space of the virtual network"
  default     = ["172.16.0.0/24"]
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
  default     = "vscode-terraform-snet"
}

variable "subnet_address" {
  type        = list(any)
  description = "Address space of the subnet"
  default     = ["172.16.0.0/24"]
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

variable "adminPassword" {
  type    = string
  default = "P@$$w0rd1234!"
}