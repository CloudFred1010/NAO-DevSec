resource "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"

  # ✅ Retain logs for 90 days (can extend for compliance)
  retention_in_days   = 90
}

resource "azurerm_monitor_diagnostic_setting" "appservice_diagnostics" {
  name                       = "${var.app_name}-diag"
  target_resource_id         = var.app_service_id   # ✅ Provided by appservice module
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  # ✅ Use enabled_log instead of log
  enabled_log {
    category = "AppServiceHTTPLogs"
  }

  enabled_log {
    category = "AppServiceConsoleLogs"
  }

  # ✅ Use enabled_metric instead of metric
  enabled_metric {
    category = "AllMetrics"
  }
}
