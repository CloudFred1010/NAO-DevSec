variable "resource_group_name" {
  description = "Resource group in which to deploy the NSG"
  type        = string
}

variable "location" {
  description = "Azure region for NSG"
  type        = string
}

variable "admin_ip" {
  description = "Public IPv4 address of the admin workstation allowed for SSH (without /32 suffix)"
  type        = string
}
