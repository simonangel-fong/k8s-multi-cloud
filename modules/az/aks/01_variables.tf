# variables.tf

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the AKS cluster"
  type        = string
}

variable "rg_name" {
  description = "Resource group hosting the cluster"
  type        = string
}

variable "rg_location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where AKS nodes will be placed"
  type        = string
}

# ##############################
# Default (system) node pool
# ##############################
variable "default_node_pool" {
  description = "Default system node pool settings"
  type = object({
    vm_size      = string
    node_count   = number
    min_count    = number
    max_count    = number
    auto_scaling = bool
  })
  default = {
    vm_size      = "standard_dc2s_v3"
    node_count   = 2
    min_count    = 1
    max_count    = 3
    auto_scaling = true
  }
}

variable "cluster_tags" {
  description = "Tags applied to all AKS resources"
  type        = map(string)
  default     = {}
}
