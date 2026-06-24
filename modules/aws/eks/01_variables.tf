# variable.tf
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs where the EKS control plane ENIs will be placed (at least two AZs)"
  type        = list(string)
}

variable "endpoint_public_access" {
  description = "Whether the EKS public API endpoint is enabled"
  type        = bool
  default     = true
}

variable "endpoint_private_access" {
  description = "Whether the EKS private API endpoint is enabled"
  type        = bool
  default     = false
}

variable "addons" {
  type = list(object({
    name    = string
    version = string
    config  = map(any)
  }))
  default = [
    {
      name    = "kube-proxy"
      version = "v1.36.0-eksbuild.7"
      config  = {}
    },
    {
      name    = "vpc-cni"
      version = "v1.22.1-eksbuild.2"
      config  = {}
    },
    {
      name    = "coredns"
      version = "v1.14.3-eksbuild.2"
      config  = {}
    }
  ]
}


variable "cluster_tags" {
  description = "Tags applied to all EKS resources"
  type        = map(string)
  default     = {}
}
