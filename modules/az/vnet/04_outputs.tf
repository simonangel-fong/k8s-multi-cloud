# outputs.tf
output "vnet_id" { value = azurerm_virtual_network.this.id }
output "vnet_name" { value = azurerm_virtual_network.this.name }
output "vnet_cidr" { value = one(azurerm_virtual_network.this.address_space) }
output "aks_subnet_id" { value = azurerm_subnet.aks.id }
output "aks_subnet_cidr" { value = azurerm_subnet.aks.address_prefixes[0] }
