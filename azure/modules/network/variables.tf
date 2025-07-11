# modules/network/variables.tf

variable "vnet_name" {
  type        = string
  description = "Nom du réseau virtuel"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Espace d'adressage du réseau virtuel"
}

variable "subnet_name" {
  type        = string
  description = "Nom du sous-réseau"
}

variable "subnet_address_space" {
  type        = list(string)
  description = "Espace d'adressage du sous-réseau"
}

variable "nsg_name" {
  type        = string
  description = "Nom du groupe de sécurité réseau"
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