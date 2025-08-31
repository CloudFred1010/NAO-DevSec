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

  # ✅ Firewall rules
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"

    # FIXED: Must be valid IPv4/CIDR
    ip_rules                   = [var.admin_ip]

    # If you want VNets, wire them here later
    virtual_network_subnet_ids = []
  }
}

# ✅ Access policy for Terraform SPN/current user
resource "azurerm_key_vault_access_policy" "current_user" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get", "List", "Set", "Delete", "Purge", "Recover"
  ]
}

data "azurerm_client_config" "current" {}
