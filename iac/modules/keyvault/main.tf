resource "azurerm_key_vault" "kv" {
  name                        = var.kv_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = true
  soft_delete_retention_days  = 30

  # ✅ Security: disable public network access
  public_network_access_enabled = false

  # ✅ Security: enforce firewall rules
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices" # allows trusted services like Azure DevOps
    ip_rules                   = ["YOUR_IP/32"]  # replace with your admin/dev IP
    virtual_network_subnet_ids = []              # can add VNets later
  }
}

# ✅ Keep existing access policy for Terraform SPN/current user
resource "azurerm_key_vault_access_policy" "current_user" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get", "List", "Set", "Delete", "Purge", "Recover"
  ]
}

data "azurerm_client_config" "current" {}
