variable "prod_rg" {
  type    = string
  default = "prod-resource-group"
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "prod_storage_account" {
  type    = string
  default = "prodsa20230926"
}

variable "prod_virtual_network" {
  type    = string
  default = "prod-vnet"
}

variable "prod_virtual_network_address" {
  type    = list(any)
  default = ["10.0.0.0/24"]
}

variable "prod_subnet" {
  type    = string
  default = "prod-snet"
}

variable "prod_subnet_address" {
  type    = list(any)
  default = ["10.0.0.0/24"]
}

variable "prod_pip" {
  type    = string
  default = "prod-public-ip"
}

variable "prod_network_security_group" {
  type    = string
  default = "prod-nsg"
}

variable "prod_network_interface" {
  type    = string
  default = "prod-nic"
}

variable "prod_virtual_machine" {
  type    = string
  default = "prod-vm"
}

variable "prod_adminUser" {
  type    = string
  default = "azureuser"
}

variable "prod_adminPasswrod" {
  type    = string
  default = "Azuredevops@12345"
}