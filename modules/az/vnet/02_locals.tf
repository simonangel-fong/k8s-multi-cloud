# locals.tf

locals {
  # /20 = 4,096 addresses for the AKS node/pod subnet
  aks_subnet_cidr = cidrsubnet(var.vnet_cidr, 4, 0)
}
