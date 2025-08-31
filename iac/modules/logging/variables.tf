variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "log_analytics_name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
}

variable "app_name" {
  description = "App Service name for diagnostics naming"
  type        = string
}

variable "app_service_id" {
  description = "The ID of the App Service to attach diagnostics"
  type        = string
}
