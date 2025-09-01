variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where ACR will be created"
  type        = string
}

variable "location" {
  description = "Azure location for the ACR"
  type        = string
}
