# outputs.tf (racine du projet)

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "load_balancer_ip" {
  value       = module.loadbalancer.public_ip_address
  description = "Adresse IP publique du load balancer"
}

output "vmss_id" {
  value = module.vmss.vmss_id
}

output "vmss_name" {
  value = module.vmss.vmss_name
}


output "sql_server_id" {
  value = module.mssql.sql_server_id
}

output "sql_server_fqdn" {
  value = module.mssql.sql_server_fqdn
}