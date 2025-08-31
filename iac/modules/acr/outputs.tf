output "acr_login_server" {
  description = "The login server URL of the ACR (e.g., naojuiceshopacr.azurecr.io)"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_id" {
  description = "The ID of the ACR resource"
  value       = azurerm_container_registry.acr.id
}
