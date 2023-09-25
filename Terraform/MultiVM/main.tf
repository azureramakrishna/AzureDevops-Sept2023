# Terraform Provider Azurerm version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.70.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Terraform Backend
terraform {
  backend "azurerm" {
    resource_group_name  = "Cloud-shell-resource-group"
    storage_account_name = "saanvikitcloudshell"
    container_name       = "tfstate"
    key                  = "multivm.terraform.tfstate"
  }
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create a storage account
resource "azurerm_storage_account" "sa" {
  name                     = lower(var.storage_account_name)
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.virtual_network_address
}

resource "azurerm_subnet" "snet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address
}

# Create a public ip
resource "azurerm_public_ip" "pip" {
  name                = "${var.public_ip_name}-${count.index}"
  count               = var.count_value
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

# Create a network security group
resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create a Network interface
resource "azurerm_network_interface" "nic" {
  depends_on          = [azurerm_public_ip.pip, azurerm_subnet.snet]
  name                = "${var.network_interface_name}-${count.index}"
  count               = var.count_value
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip[count.index].id
  }
}

# Associate NSG with Subnet
resource "azurerm_subnet_network_security_group_association" "example" {
  depends_on                = [azurerm_subnet.snet, azurerm_network_security_group.nsg]
  subnet_id                 = azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Create a windows virtual machine
resource "azurerm_windows_virtual_machine" "vm" {
  depends_on          = [azurerm_network_interface.nic]
  name                = "${var.virtual_machine_name}-${count.index}"
  count               = var.count_value
  computer_name       = "testvm-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_Ds1_v2"
  admin_username      = var.adminuser
  admin_password      = var.adminPassword
  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id,
  ]

  os_disk {
    name                 = "${var.virtual_machine_name}-osdisk-${count.index}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}


