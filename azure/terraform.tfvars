# terraform.tfvars

# Groupe de ressources
resource_group_name = "rg-web-app-prod"
location           = "France Central"

# Network
vnet_name              = "vnet-web-app"
vnet_address_space     = ["10.0.0.0/16"]
subnet_name            = "subnet-web-app"
subnet_address_space   = ["10.0.1.0/24"]
nsg_name               = "nsg-web-app"

# Load Balancer
public_ip_name         = "pip-web-app"
lb_name                = "lb-web-app"
lb_frontend_name       = "frontend-web-app"
lb_backend_pool_name   = "backend-pool-web-app"

# VMSS
vmss_name              = "vmss-web-app"
vm_size                = "Standard_B1s"
instance_count         = 2
scale_min              = 1
scale_max              = 5
network_maxbytes       = 100000
network_minbytes       = 50000
admin_username         = "azureuser"
admin_password         = "VotreMotDePasseComplexe123!"

# Tags
tags = {
  Environment = "Production"
  Project     = "WebApp"
  Owner       = "DevOps Team"
}

# SQL Server
sql_server_name      = "sqlserver-web-app"
sql_database_name    = "bdd-main"
sql_admin_login      = "sqladminuser"
sql_admin_password   = "ChangeMe123!"
#tnant_id            = var.ARM_TENANT_ID 
#subscription_id      = var.ARM_SUBSCRIPTION_ID