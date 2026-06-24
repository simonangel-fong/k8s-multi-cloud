# variables.tf

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "rg_location" {
  description = "Azure region"
  type        = string
}

variable "rg_tags" {
  description = "Tags applied to the resource group"
  type        = map(string)
  default     = {}
}
