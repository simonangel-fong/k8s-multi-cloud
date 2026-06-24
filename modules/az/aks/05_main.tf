# main.tf

# ##############################
# AKS Cluster
# ##############################
resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  dns_prefix          = var.cluster_name
  kubernetes_version  = var.cluster_version

  # ####################
  # identity
  # ####################
  identity {
    type = "SystemAssigned"
  }

  # ####################
  # default (system) node pool
  # ####################
  default_node_pool {
    name                 = "system"
    vm_size              = var.default_node_pool.vm_size
    node_count           = var.default_node_pool.node_count
    auto_scaling_enabled = var.default_node_pool.auto_scaling
    min_count            = var.default_node_pool.auto_scaling ? var.default_node_pool.min_count : null
    max_count            = var.default_node_pool.auto_scaling ? var.default_node_pool.max_count : null
    vnet_subnet_id       = var.subnet_id
  }

  # ####################
  # networking
  # ####################
  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }

  # ####################
  # workload identity / OIDC
  # ####################
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  tags = merge(
    var.cluster_tags,
    { Name = var.cluster_name }
  )
}
