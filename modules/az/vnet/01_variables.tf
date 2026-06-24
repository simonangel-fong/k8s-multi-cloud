# variables.tf

variable "vnet_name" {
  description = "Name used to prefix all VNet resources"
  type        = string
}

variable "rg_name" {
  description = "Resource group hosting the VNet"
  type        = string
}

variable "rg_location" {
  description = "Azure region"
  type        = string
}

variable "vnet_cidr" {
  description = "CIDR block for the VNet"
  type        = string
  default     = "10.10.0.0/16"
}

variable "vnet_tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}
