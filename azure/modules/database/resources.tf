# modules/mssql_server/main.tf

resource "azurerm_mssql_server" "this" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password
  minimum_tls_version          = var.minimum_tls_version

  tags = var.tags
}

resource "azurerm_mssql_database" "sqldb" {
  name           = var.sql_database_name
  server_id      = azurerm_mssql_server.this.id
  sku_name       = "S0" # Standard Tier
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb    = 5
  zone_redundant = false

  tags = var.tags
}







resource "azurerm_mssql_virtual_network_rule" "allow_vnet" {
  name      = "${var.sql_server_name}-vnet-rule"
  server_id = azurerm_mssql_server.this.id
  subnet_id = var.subnet_id
  ignore_missing_vnet_service_endpoint = true
}