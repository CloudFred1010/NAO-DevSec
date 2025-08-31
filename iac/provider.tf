terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # ✅ Local state for now (terraform.tfstate in working dir)
  # For team use / pipelines, enable remote backend:
  # backend "azurerm" {
  #   resource_group_name  = "nao-tfstate-rg"
  #   storage_account_name = "naoterraformstate"
  #   container_name       = "tfstate"
  #   key                  = "juice-shop.tfstate"
  # }
}

provider "azurerm" {
  features {}

  # ✅ Authenticate via Azure CLI (works locally + GitHub Actions OIDC)
  use_cli = true

  # ❌ Hardcoding IDs is not recommended.
  # 🔑 Prefer environment variables:
  #   ARM_SUBSCRIPTION_ID
  #   ARM_TENANT_ID
  #
  # Example (Linux/macOS):
  # export ARM_SUBSCRIPTION_ID="555334d6-5045-4e6e-ab45-bab9da136091"
  # export ARM_TENANT_ID="952e47c4-05de-4282-83af-5f4b46b1628f"
}
