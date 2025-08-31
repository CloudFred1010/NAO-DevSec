output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "app_id" {
  value = module.appservice.app_id
}

output "kv_id" {
  value = module.keyvault.kv_id
}

output "kv_uri" {
  value = module.keyvault.kv_uri
}

output "log_analytics_id" {
  value = module.logging.log_analytics_id
}

output "nsg_id" {
  value = module.network.nsg_id
}
