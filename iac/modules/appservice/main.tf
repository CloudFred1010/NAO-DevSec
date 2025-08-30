resource "azurerm_service_plan" "asp" {
  name                = "${var.app_name}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_app_service" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_service_plan.asp.id

  site_config {
    linux_fx_version = "DOCKER|${var.acr_login_server}/${var.app_name}:latest"
    always_on        = true
    ftps_state       = "Disabled"
  }

  identity {
    type = "SystemAssigned"
  }

  https_only = true
}
