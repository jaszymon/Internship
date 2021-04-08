terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    subscription_id = "10430aba-bdac-486e-94b9-e0ef00e82eb8"
  features {}
}


resource "azurerm_resource_group" "terraformRG" {
  name     = "terraform-rg"
  location = "West Europe"
}

resource "azurerm_network_security_group" "terraformSG" {
  name                = "TerraformSecurityGroup"
  resource_group_name = azurerm_resource_group.terraformRG.name
  location            = azurerm_resource_group.terraformRG.location


    security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
                }
}

resource "azurerm_network_security_group" "terraformSG2" {
  name                = "TerraformSecurityGroup2"
  resource_group_name = azurerm_resource_group.terraformRG.name
  location            = azurerm_resource_group.terraformRG.location


    security_rule {
    name                       = "test1234"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
                }
}

resource "azurerm_network_security_group" "terraformSG3" {
  name                = "TerraformSecurityGroup3"
  resource_group_name = azurerm_resource_group.terraformRG.name
  location            = azurerm_resource_group.terraformRG.location


    security_rule {
    name                       = "test12345"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
                }
}

resource "azurerm_virtual_network" "terraformvnet1" {
  name                = "terraform-vnet1"
  location            = azurerm_resource_group.terraformRG.location
  resource_group_name = azurerm_resource_group.terraformRG.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["8.8.8.8", "8.8.4.4"]
}

resource "azurerm_subnet" "terraformsubnet1" {
    name="terraform-vnet1-subnet01"
    resource_group_name = azurerm_resource_group.terraformRG.name
    virtual_network_name = azurerm_virtual_network.terraformvnet1.name
    address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "terraformsubnet2" {
    name="terraform-vnet1-subnet02"
    resource_group_name = azurerm_resource_group.terraformRG.name
    virtual_network_name = azurerm_virtual_network.terraformvnet1.name
    address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_virtual_network" "terraformvnet2" {
  name                = "terraform-vnet2"
  location            = azurerm_resource_group.terraformRG.location
  resource_group_name = azurerm_resource_group.terraformRG.name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["8.8.8.8", "8.8.4.4"]
}

resource "azurerm_subnet" "terraformsubnet3" {
    name="terraform-vnet1-subnet03"
    resource_group_name = azurerm_resource_group.terraformRG.name
    virtual_network_name = azurerm_virtual_network.terraformvnet2.name
    address_prefixes = ["10.1.1.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "vnet1sub1" {
  subnet_id                 = azurerm_subnet.terraformsubnet1.id
  network_security_group_id = azurerm_network_security_group.terraformSG.id
}

resource "azurerm_subnet_network_security_group_association" "vnet1sub2" {
  subnet_id                 = azurerm_subnet.terraformsubnet2.id
  network_security_group_id = azurerm_network_security_group.terraformSG2.id
}
resource "azurerm_subnet_network_security_group_association" "vnet2sub3" {
  subnet_id                 = azurerm_subnet.terraformsubnet3.id
  network_security_group_id = azurerm_network_security_group.terraformSG3.id
}
