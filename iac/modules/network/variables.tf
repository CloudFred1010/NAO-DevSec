variable "resource_group_name" {
  description = "Resource group in which to deploy the NSG"
  type        = string
}

variable "location" {
  description = "Azure region for NSG"
  type        = string
}
