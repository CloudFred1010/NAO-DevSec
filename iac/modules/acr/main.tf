resource "azurerm_container_registry" "acr" {
  name                          = var.acr_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = "Premium"
  admin_enabled                 = false

  # ✅ Security: disable public access
  public_network_access_enabled = false
}

# ✅ Retention policy is a separate resource in azurerm v4+
resource "azurerm_container_registry_retention_policy" "acr_retention" {
  name                  = "cleanup-untagged"
  container_registry_id = azurerm_container_registry.acr.id
  days                  = 30
  type                  = "UntaggedManifests"
}
