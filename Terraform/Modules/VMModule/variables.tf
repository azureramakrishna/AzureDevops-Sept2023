variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "virtual_network_address" {
  type        = list(any)
  description = "Address space of the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "subnet_address" {
  type        = list(any)
  description = "Address space of the subnet"
}

variable "public_ip_name" {
  type        = string
  description = "Name of the public ip"
}

variable "network_security_group_name" {
  type        = string
  description = "Name of the network security group"
}

variable "network_interface_name" {
  type        = string
  description = "Name of the network interface"
}

variable "virtual_machine_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "adminuser" {
  type    = string
}

variable "adminPassword" {
  type    = string
}