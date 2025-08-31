# ---------------------------
# Log Analytics Workspace
# ---------------------------
resource "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"

  # 🔒 Keep logs for 90 days (can increase up to 730 for compliance/audit)
  retention_in_days   = 90

  tags = {
    environment = "devsecops"
    owner       = "wilfr"
  }
}

# ---------------------------
# Diagnostic Settings for App Service
# ---------------------------
resource "azurerm_monitor_diagnostic_setting" "appservice_diagnostics" {
  name                       = "${var.app_name}-diag"
  target_resource_id         = var.app_service_id   # ✅ Passed in from appservice module
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  # ✅ Logs
  enabled_log {
    category = "AppServiceHTTPLogs"
  }

  enabled_log {
    category = "AppServiceConsoleLogs"
  }

  enabled_log {
    category = "AppServiceAppLogs"
  }

  enabled_log {
    category = "AppServiceAuditLogs"
  }

  # ✅ Metrics
  enabled_metric {
    category = "AllMetrics"
  }
}
