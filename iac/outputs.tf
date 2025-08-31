output "acr_login_server" {
  description = "The login server URL of the Azure Container Registry"
  value       = module.acr.acr_login_server
}

output "app_id" {
  description = "The resource ID of the App Service"
  value       = module.appservice.app_id
}

output "kv_id" {
  description = "The resource ID of the Key Vault"
  value       = module.keyvault.kv_id
}

output "kv_uri" {
  description = "The URI endpoint of the Key Vault"
  value       = module.keyvault.kv_uri
}

output "log_analytics_id" {
  description = "The resource ID of the Log Analytics Workspace"
  value       = module.logging.log_analytics_id
}

output "nsg_id" {
  description = "The resource ID of the Network Security Group"
  value       = module.network.nsg_id
}
