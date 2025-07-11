# modules/mssql_server/variables.tf

variable "sql_server_name" {
  type        = string
  description = "Nom du serveur MSSQL"
}

variable "sql_database_name" {
  type        = string
  description = "Nom de la base de donnée MSSQL"
}



variable "administrator_login" {
  type        = string
  description = "Login administrateur du serveur MSSQL"
}

variable "administrator_password" {
  type        = string
  description = "Mot de passe administrateur du serveur MSSQL"
  sensitive   = true
}

variable "sql_version" {
  type        = string
  description = "Version du serveur MSSQL"
  default     = "12.0"
}

variable "minimum_tls_version" {
  type        = string
  description = "Version TLS minimum"
  default     = "1.2"
}

variable "subnet_id" {
  type        = string
  description = "ID du sous-réseau autorisé"
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