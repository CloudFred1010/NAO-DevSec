variable "resource_group_name" {
  description = "Resource group name for the Key Vault"
  type        = string
}

variable "location" {
  description = "Azure location for the Key Vault"
  type        = string
}

variable "kv_name" {
  description = "Name of the Key Vault"
  type        = string
}

variable "admin_ip" {
  description = "Your public IP/CIDR allowed to access the Key Vault"
  type        = string
  default     = "123.45.67.89/32" # ✅ replace with your actual public IP
}
