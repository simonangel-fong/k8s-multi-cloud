# main.tf

# ##############################
# Resource Group
# ##############################
resource "azurerm_resource_group" "this" {
  name     = var.rg_name
  location = var.rg_location
  tags     = var.rg_tags
}
