variable "resource_group_name" {
  description = "Resource group where the App Service will be created"
  type        = string
}

variable "location" {
  description = "Azure location for the App Service"
  type        = string
}

variable "app_name" {
  description = "The name of the App Service"
  type        = string
}

variable "acr_login_server" {
  description = "The login server of the ACR (e.g., naojuiceshopacr.azurecr.io)"
  type        = string
}

variable "kv_id" {
  description = "Key Vault ID (optional, for secret integration)"
  type        = string
  default     = null
}

variable "log_analytics_id" {
  description = "Log Analytics Workspace ID (optional, for diagnostics)"
  type        = string
  default     = null
}
