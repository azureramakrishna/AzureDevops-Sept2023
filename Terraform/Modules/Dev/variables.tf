variable "dev_rg" {
  type    = string
  default = "dev-resource-group"
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "dev_storage_account" {
  type    = string
  default = "devsa20230926"
}

variable "dev_virtual_network" {
  type    = string
  default = "dev-vnet"
}

variable "dev_virtual_network_address" {
  type    = list(any)
  default = ["10.0.0.0/24"]
}

variable "dev_subnet" {
  type    = string
  default = "dev-snet"
}

variable "dev_subnet_address" {
  type    = list(any)
  default = ["10.0.0.0/24"]
}

variable "dev_pip" {
  type    = string
  default = "dev-public-ip"
}

variable "dev_network_security_group" {
  type    = string
  default = "dev-nsg"
}

variable "dev_network_interface" {
  type    = string
  default = "dev-nic"
}

variable "dev_virtual_machine" {
  type    = string
  default = "dev-vm"
}

variable "dev_adminUser" {
  type    = string
  default = "azureuser"
}

variable "dev_adminPasswrod" {
  type    = string
  default = "Azuredevops@12345"
}