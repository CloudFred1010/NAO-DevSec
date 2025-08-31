output "app_id" {
  description = "ID of the Linux Web App"
  value       = azurerm_linux_web_app.app.id
}

output "app_default_hostname" {
  description = "Default hostname of the Linux Web App"
  value       = azurerm_linux_web_app.app.default_hostname
}
