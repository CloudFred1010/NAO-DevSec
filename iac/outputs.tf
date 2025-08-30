output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "app_service_url" {
  value = module.appservice.app_url
}

output "key_vault_uri" {
  value = module.keyvault.kv_uri
}
