# modules/loadbalancer/variables.tf

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

variable "location" {
  type        = string
  description = "Localisation Azure"
}

variable "resource_group_name" {
  type        = string
  description = "Nom du groupe de ressources"
}

variable "tags" {
  type        = map(string)
  description = "Tags à appliquer aux ressources"
  default     = {}
}