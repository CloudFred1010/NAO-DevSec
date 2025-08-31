terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # ✅ Local state for now (terraform.tfstate in working dir)
  # If you want remote state later, uncomment and update this:
  # backend "azurerm" {
  #   resource_group_name  = "nao-tfstate-rg"
  #   storage_account_name = "naoterraformstate"
  #   container_name       = "tfstate"
  #   key                  = "juice-shop.tfstate"
  # }
}

provider "azurerm" {
  features {}

  # ✅ Authenticate via Azure CLI (recommended for GitHub Actions & local)
  use_cli         = true
  subscription_id = "555334d6-5045-4e6e-ab45-bab9da136091"
  tenant_id       = "952e47c4-05de-4282-83af-5f4b46b1628f"
}
