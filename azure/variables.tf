# variables.tf (racine du projet)

variable "resource_group_name" {
  type        = string
  description = "Nom du groupe de ressources"
}

variable "location" {
  type        = string
  description = "Localisation Azure"
  default     = "France Central"
}

# Variables Network
variable "vnet_name" {
  type        = string
  description = "Nom du réseau virtuel"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Espace d'adressage du réseau virtuel"
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  type        = string
  description = "Nom du sous-réseau"
}

variable "subnet_address_space" {
  type        = list(string)
  description = "Espace d'adressage du sous-réseau"
  default     = ["10.0.1.0/24"]
}

variable "nsg_name" {
  type        = string
  description = "Nom du groupe de sécurité réseau"
}

# Variables Load Balancer
variable "public_ip_name" {
  type        = string
  description = "Nom de l'adresse IP publique"
}

variable "lb_name" {
  type        = string
  description = "Nom du load balancer"
}

variable "lb_frontend_name" {
  type        = string
  description = "Nom de la configuration frontend du load balancer"
}

variable "lb_backend_pool_name" {
  type        = string
  description = "Nom du pool backend du load balancer"
}

# Variables VMSS
variable "vmss_name" {
  type        = string
  description = "Nom du Virtual Machine Scale Set"
}

variable "vm_size" {
  type        = string
  description = "Taille des instances VM"
  default     = "Standard_B1s"
}

variable "instance_count" {
  type        = number
  description = "Nombre d'instances par défaut"
  default     = 2
}

variable "scale_min" {
  type        = number
  description = "Nombre minimum d'instances"
  default     = 1
}

variable "scale_max" {
  type        = number
  description = "Nombre maximum d'instances"
  default     = 10
}

variable "network_maxbytes" {
  type        = number
  description = "Seuil maximum de trafic réseau pour scale-out"
  default     = 100000
}

variable "network_minbytes" {
  type        = number
  description = "Seuil minimum de trafic réseau pour scale-in"
  default     = 50000
}

variable "admin_username" {
  type        = string
  description = "Nom d'utilisateur administrateur"
}

variable "admin_password" {
  type        = string
  description = "Mot de passe administrateur"
  sensitive   = true
}

variable "tags" {
  type        = map(string)
  description = "Tags à appliquer aux ressources"
  default     = {}
}

# Variables SQL Server
variable "sql_server_name" {
  type        = string
  description = "Nom du serveur MSSQL"
}

variable "sql_database_name" {
  type        = string
  description = "Nom de la base de donnée MSSQL"
}



variable "sql_admin_login" {
  type        = string
  description = "Login administrateur du serveur MSSQL"
}

variable "sql_admin_password" {
  type        = string
  description = "Mot de passe administrateur du serveur MSSQL"
  sensitive   = true
}

variable "sql_version" {
  type        = string
  description = "Version du serveur MSSQL"
  default     = "12.0"
}

variable "sql_minimum_tls" {
  type        = string
  description = "Version TLS minimum pour le serveur MSSQL"
  default     = "1.2"
}


variable "tenant_id" {}

variable "subscription_id" {}