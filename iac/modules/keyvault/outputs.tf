output "kv_id" {
  description = "ID of the Key Vault"
  value       = azurerm_key_vault.kv.id
}

output "kv_uri" {
  description = "DNS URI of the Key Vault"
  value       = azurerm_key_vault.kv.vault_uri
}
