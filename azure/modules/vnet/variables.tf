variable "resource_group_name" {
    type = string
}

variable "location" {
    type = string
    default = "West Europe"
}

variable "address_space" {
    description = "(Required) The address space that is used the virtual network. You can supply more than one address space."
    type = string
}

variable "envrionment" {
    type = string
}

variable "projet" {
    type = string
}