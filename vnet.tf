provider "azurerm" {
  version = "=1.44.0"
}

module "network" {
  source  = "app.terraform.io/djarvey-training/network/azurerm"
  version = "3.0.1"
}

resource "azurerm_resource_group" "myresourcegroup" {
  name     = "${var.prefix}-workshop"
  location = var.location
}

resource "azurerm_virtual_network" "vnetdb" {
  name                = "${var.prefix}-vnetdb"
  location            = azurerm_resource_group.myresourcegroup.location
  address_space       = [var.address_space]
  resource_group_name = azurerm_resource_group.myresourcegroup.name