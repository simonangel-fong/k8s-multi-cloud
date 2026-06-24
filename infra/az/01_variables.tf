# variables.tf

# ##############################
# Project Metadata
# ##############################
variable "project_name" {
  type    = string
  default = "multi-cloud-k8s"
}

# ##############################
# Environment
# ##############################
variable "env" {
  type = string
}

# ##############################
# Azure
# ##############################
variable "az_location" {
  type = string
}
