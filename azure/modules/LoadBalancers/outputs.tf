# modules/loadbalancer/outputs.tf

output "public_ip_address" {
  value = azurerm_public_ip.pip.ip_address
}

output "public_ip_id" {
  value = azurerm_public_ip.pip.id
}

output "lb_id" {
  value = azurerm_lb.lb.id
}

output "backend_pool_id" {
  value = azurerm_lb_backend_address_pool.backend_pool.id
}

output "lb_frontend_name" {
  value = var.lb_frontend_name
}