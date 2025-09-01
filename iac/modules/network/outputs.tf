output "nsg_id" {
  description = "ID of the NSG"
  value       = azurerm_network_security_group.secure_nsg.id
}
