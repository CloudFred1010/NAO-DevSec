variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "uksouth" # must match Azure region short name
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "nao-juice-rg"
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "kv_name" {
  description = "The name of the Azure Key Vault"
  type        = string
}

variable "app_name" {
  description = "The name of the App Service / Web App"
  type        = string
}

variable "log_analytics_name" {
  description = "The name of the Log Analytics Workspace"
  type        = string
}

variable "admin_ip" {
  description = "Public IPv4 address of the admin workstation allowed for SSH (e.g., 203.0.113.25)"
  type        = string
}
