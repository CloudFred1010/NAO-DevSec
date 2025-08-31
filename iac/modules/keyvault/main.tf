# ---------------------------
# Key Vault
# ---------------------------
resource "azurerm_key_vault" "kv" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  # 🔒 Security
  purge_protection_enabled     = true   # Protect against accidental deletion
  soft_delete_retention_days   = 30     # 7–90 days allowed
  public_network_access_enabled = false

  # 🔒 Firewall rules
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"

    # ✅ Must be valid IPv4/CIDR string, e.g., "203.0.113.25/32"
    ip_rules = [var.admin_ip]

    # Empty for now – can add VNet private endpoints later
    virtual_network_subnet_ids = []
  }

  tags = {
    environment = "devsecops"
    owner       = "wilfr"
  }
}

# ---------------------------
# Access policy – Terraform SPN/current user
# ---------------------------
resource "azurerm_key_vault_access_policy" "current_user" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get", "List", "Set", "Delete", "Purge", "Recover"
  ]
}

# ---------------------------
# Data source – logged in identity
# ---------------------------
data "azurerm_client_config" "current" {}
