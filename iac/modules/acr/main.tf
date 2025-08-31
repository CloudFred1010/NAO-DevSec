resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false

  # 🔒 Security best practice: disable public network access
  public_network_access_enabled = false

  # 🔑 Optional: enable later if you want to enforce image retention
  # retention_policy {
  #   days    = 7
  #   enabled = true
  # }

  tags = {
    environment = "devsecops"
    owner       = "wilfr"
  }
}
