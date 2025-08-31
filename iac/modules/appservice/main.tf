# ---------------------------
# App Service Plan
# ---------------------------
resource "azurerm_service_plan" "asp" {
  name                = "${var.app_name}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "S1"

  # ✅ Correct for v4+
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
    linux_fx_version  = "DOCKER|${var.acr_login_server}/${var.app_name}:latest"
    always_on         = true
    ftps_state        = "Disabled"

    # ✅ Valid settings in v4
    http2_enabled     = true
    health_check_path = "/"
  }

  https_only = true

  identity {
    type = "SystemAssigned"
  }
}

# ---------------------------
# App Service Authentication
# ---------------------------
# ✅ FIX: v2 resource not supported, use v1
resource "azurerm_app_service_auth_settings" "auth" {
  name                = azurerm_app_service.app.name
  resource_group_name = var.resource_group_name
  enabled             = true

  active_directory {
    client_id     = "00000000-0000-0000-0000-000000000000" #  replace with your App Registration client_id
    client_secret = "placeholder-secret"                  #  normally from Key Vault
  }
}
