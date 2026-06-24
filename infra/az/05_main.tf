# main.tf

# ##############################
# Resource Group
# ##############################
module "rg" {
  source = "../../modules/az/rg"

  rg_name     = local.common_name
  rg_location = var.az_location
  rg_tags     = local.tags
}

# ##############################
# VNet
# ##############################
module "vnet" {
  source = "../../modules/az/vnet"

  vnet_name   = local.common_name
  rg_name     = module.rg.rg_name
  rg_location = module.rg.rg_location
  vnet_cidr   = local.vnet_cidr
  vnet_tags   = local.tags
}

# ##############################
# AKS
# ##############################
module "aks" {
  source = "../../modules/az/aks"

  cluster_name    = local.common_name
  cluster_version = local.cluster_version
  rg_name         = module.rg.rg_name
  rg_location     = module.rg.rg_location
  subnet_id       = module.vnet.aks_subnet_id
  cluster_tags    = local.tags
}
