# ---------------------------
# App Service Plan
# ---------------------------
resource "azurerm_service_plan" "asp" {
  name                = "${var.app_name}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "S1"

  # ❌ Not supported for Standard SKU
  # zone_balancing_enabled = true
}

# ---------------------------
# Linux Web App (recommended replacement for App Service)
# ---------------------------
resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      docker_image_name   = "${var.acr_login_server}/${var.app_name}:latest"
      docker_registry_url = "https://${var.acr_login_server}"
    }

    always_on  = true
    ftps_state = "Disabled"
    http2_enabled = true

    # ✅ Both required together in v4.42
    health_check_path                 = "/"
    health_check_eviction_time_in_min = 5
  }

  https_only = true

  identity {
    type = "SystemAssigned"
  }
}

# ---------------------------
# App Service Authentication
# ---------------------------
# ⚠️ Authentication support depends on azurerm provider >= v4.55
# Leave commented until upgrade
#
# resource "azurerm_app_service_auth_settings_v2" "auth" {
#   name                = azurerm_linux_web_app.app.name
#   resource_group_name = var.resource_group_name
#   auth_enabled        = true
#
#   login {
#     azure_active_directory {
#       enabled = true
#     }
#   }
# }
