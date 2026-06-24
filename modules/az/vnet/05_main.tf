# main.tf

# ##############################
# VNet
# ##############################
resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  address_space       = [var.vnet_cidr]

  tags = merge(
    var.vnet_tags,
    { Name = var.vnet_name }
  )
}

# ##############################
# AKS subnet
# ##############################
resource "azurerm_subnet" "aks" {
  name                 = "${var.vnet_name}-aks-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [local.aks_subnet_cidr]
}
