variable "resource_group_name" {
  description = "The resource group for Log Analytics"
  type        = string
}

variable "location" {
  description = "Azure region where Log Analytics will be deployed"
  type        = string
}

variable "log_analytics_name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
}

variable "app_name" {
  description = "App Service name (used in diagnostic setting name)"
  type        = string
}

variable "app_service_id" {
  description = "The ID of the App Service to attach diagnostics"
  type        = string
}
