variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "UK South"
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "nao-juice-rg"
}

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
  default     = "naojuiceshopacr"
}

variable "kv_name" {
  description = "Key Vault name"
  type        = string
  default     = "naojuiceshopkv"
}

variable "log_analytics_name" {
  description = "Log Analytics Workspace name"
  type        = string
  default     = "naojuiceshoplaw"
}

variable "app_name" {
  description = "App Service name"
  type        = string
  default     = "nao-juice-shop"
}
