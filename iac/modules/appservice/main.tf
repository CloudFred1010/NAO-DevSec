# ---------------------------
# App Service Plan
# ---------------------------
resource "azurerm_service_plan" "asp" {
  name                = "${var.app_name}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "S1"

  # ✅ Updated for azurerm v4+
  zone_balancing_enabled = true
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
    linux_fx_version               = "DOCKER|${var.acr_login_server}/${var.app_name}:latest"
    always_on                      = true
    ftps_state                     = "Disabled"

    # ✅ Security & reliability
    http2_enabled                  = true
    detailed_error_logging_enabled = true
    failed_request_tracing_enabled = true
    health_check_path              = "/"
  }

  https_only = true

  identity {
    type = "SystemAssigned"
  }
}

# ---------------------------
# App Service Authentication
# ---------------------------
resource "azurerm_app_service_auth_settings_v2" "auth" {
  name                = azurerm_app_service.app.name
  resource_group_name = var.resource_group_name
  auth_enabled        = true

  login {
    # ✅ Enable Azure AD integration (basic)
    azure_active_directory {
      enabled = true
    }
  }
}
