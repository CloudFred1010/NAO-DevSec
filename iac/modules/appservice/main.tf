# ---------------------------
# App Service Plan
# ---------------------------
resource "azurerm_service_plan" "asp" {
  name                = "${var.app_name}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "S1"

  # ✅ High availability (zone redundancy)
  zone_redundant = true
}

# ---------------------------
# App Service
# ---------------------------
resource "azurerm_app_service" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_service_plan.asp.id

  site_config {
    linux_fx_version                 = "DOCKER|${var.acr_login_server}/${var.app_name}:latest"
    always_on                        = true
    ftps_state                       = "Disabled"

    # ✅ Security & reliability improvements
    http2_enabled                    = true           # modern protocol
    detailed_error_logging_enabled   = true           # CKV_AZURE_65
    failed_request_tracing_enabled   = true           # CKV_AZURE_66
    health_check_path                = "/"            # CKV_AZURE_213
  }

  # ✅ Enforce HTTPS only (already present)
  https_only = true

  # ✅ Identity for Key Vault integration
  identity {
    type = "SystemAssigned"
  }

  # ✅ Authentication & access control
  auth_settings {
    enabled          = true
    default_provider = "AzureActiveDirectory"
  }
}
