resource "azurerm_resource_group" "db_network" {
  name     = "${var.prefix}-workshop"
  location = var.location
}

module "network" {
  source  = "app.terraform.io/djarvey-training/network/azurerm"
  version = "3.0.1"
  resource_group_name = azurerm_resource_group.db_network.name
}
