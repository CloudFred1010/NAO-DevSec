resource "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"

  # ✅ Improve retention (30 → 90 days, or 365 for compliance)
  retention_in_days   = 90
}

# ✅ Example: enable diagnostic settings for App Service to send logs to LAW
resource "azurerm_monitor_diagnostic_setting" "appservice_diagnostics" {
  name                       = "${var.app_name}-diag"
  target_resource_id         = azurerm_app_service.app.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  # Send App Service logs & metrics
  log {
    category = "AppServiceHTTPLogs"
    enabled  = true
  }

  log {
    category = "AppServiceConsoleLogs"
    enabled  = true
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
