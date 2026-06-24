# outputs.tf
output "rg_name" { value = azurerm_resource_group.this.name }
output "rg_location" { value = azurerm_resource_group.this.location }
output "rg_id" { value = azurerm_resource_group.this.id }
