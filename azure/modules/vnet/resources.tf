locals {
    suffix_name = "${var.envrionment}-${var.projet}"
}

resource "azurerm_virtual_network" "demo" {
  name                = "vn-${local.suffix_name}"
  address_space       = [var.address_space]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "prv" {
  name                 = "sn-prv-${local.suffix_name}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.demo.name
  address_prefixes     = [cidrsubnet(var.address_space, 1, 0)]
}

resource "azurerm_subnet" "pub" {
  name                 = "sn-pub-${local.suffix_name}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.demo.name
  address_prefixes     = [cidrsubnet(var.address_space, 1, 1)]
}