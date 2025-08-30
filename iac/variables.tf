variable "location" {
  type    = string
  default = "UK South"
}

variable "resource_group_name" {
  type    = string
  default = "nao-juice-rg"
}

variable "acr_name" {
  type    = string
  default = "naojuiceshopacr"
}

variable "kv_name" {
  type    = string
  default = "naojuiceshopkv"
}

variable "log_analytics_name" {
  type    = string
  default = "naojuiceshoplaw"
}

variable "app_name" {
  type    = string
  default = "nao-juice-shop"
}
