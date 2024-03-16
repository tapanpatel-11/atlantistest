locals {
  stack = "${var.app}-${var.env}-${var.location}"

  default_tags = {
    environment = "${var.env}"
    app         = "${var.app}"
  }
}

//Create atlantis resource group
resource "azurerm_resource_group" "atlantis_rg" {
  name     = "rg-${local.stack}"
  location = var.location
  tags = local.default_tags
}

//Create a new vnet
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${local.stack}"
  location            = var.location
  resource_group_name = azurerm_resource_group.atlantis_rg.name
  address_space       = [var.vnet_cidr]
  tags = local.default_tags
}

//Create a new subnet
resource "azurerm_subnet" "atlantis-snet" {
  name                 = "snet-${local.stack}"
  resource_group_name  = azurerm_resource_group.atlantis_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.100.0.0/22"]
  service_endpoints = [
    "Microsoft.KeyVault"
  ]
}
