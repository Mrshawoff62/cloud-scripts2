# Création du groupe de ressources
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

# Module Network
module "network" {
  source = "./modules/network"

  vnet_name              = var.vnet_name
  vnet_address_space     = var.vnet_address_space
  subnet_name            = var.subnet_name
  subnet_address_space   = var.subnet_address_space
  nsg_name               = var.nsg_name
  location               = azurerm_resource_group.rg.location
  resource_group_name    = azurerm_resource_group.rg.name
  tags                   = var.tags
}

# Module Load Balancer
module "loadbalancer" {
  source = "./modules/LoadBalancers"

  public_ip_name         = var.public_ip_name
  lb_name                = var.lb_name
  lb_frontend_name       = var.lb_frontend_name
  lb_backend_pool_name   = var.lb_backend_pool_name
  location               = azurerm_resource_group.rg.location
  resource_group_name    = azurerm_resource_group.rg.name
  tags                   = var.tags
}

# Module VMSS
module "vmss" {
  source = "./modules/VMSS"

  vmss_name              = var.vmss_name
  vm_size                = var.vm_size
  instance_count         = var.instance_count
  scale_min              = var.scale_min
  scale_max              = var.scale_max
  network_maxbytes       = var.network_maxbytes
  network_minbytes       = var.network_minbytes
  admin_username         = var.admin_username
  admin_password         = var.admin_password
  subnet_id              = module.network.subnet_id
  backend_pool_id        = module.loadbalancer.backend_pool_id
  location               = azurerm_resource_group.rg.location
  resource_group_name    = azurerm_resource_group.rg.name
  tags                   = var.tags
}

module "mssql" {
  source = "./modules/database"
  sql_server_name        = var.sql_server_name
  sql_database_name      = var.sql_database_name
  administrator_login    = var.sql_admin_login
  administrator_password = var.sql_admin_password
  sql_version                = var.sql_version
  minimum_tls_version    = var.sql_minimum_tls
  subnet_id              = module.network.subnet_id
  location               = azurerm_resource_group.rg.location
  resource_group_name    = azurerm_resource_group.rg.name
  tags                   = var.tags 
}