variable "staging_rg" {
  type    = string
  default = "staging-resource-group"
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "staging_storage_account" {
  type    = string
  default = "stagingsa20230926"
}

variable "staging_virtual_network" {
  type    = string
  default = "staging-vnet"
}

variable "staging_virtual_network_address" {
  type    = list(any)
  default = ["172.16.0.0/24"]
}

variable "staging_subnet" {
  type    = string
  default = "staging-snet"
}

variable "staging_subnet_address" {
  type    = list(any)
  default = ["172.16.0.0/24"]
}

variable "staging_pip" {
  type    = string
  default = "staging-public-ip"
}

variable "staging_network_security_group" {
  type    = string
  default = "staging-nsg"
}

variable "staging_network_interface" {
  type    = string
  default = "staging-nic"
}

variable "staging_virtual_machine" {
  type    = string
  default = "staging-vm"
}

variable "staging_adminUser" {
  type    = string
  default = "azureuser"
}

variable "staging_adminPasswrod" {
  type    = string
  default = "Azuredevops@12345"
}