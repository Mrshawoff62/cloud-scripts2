# modules/vmss/variables.tf

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

variable "subnet_id" {
  type        = string
  description = "ID du sous-réseau"
}

variable "backend_pool_id" {
  type        = string
  description = "ID du pool backend du load balancer"
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