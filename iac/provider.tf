terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # ✅ Default: local state (terraform.tfstate in working dir)
  # Uncomment the block below to use a remote backend in Azure Storage.
  #
  # backend "azurerm" {
  #   resource_group_name   = "nao-tfstate-rg"
  #   storage_account_name  = "naoterraformstate"
  #   container_name        = "tfstate"
  #   key                   = "juice-shop.tfstate"
  # }
}

provider "azurerm" {
  features {}

  # ✅ Authentication handled automatically:
  # - Locally: via `az login`
  # - In GitHub Actions: via `azure/login@v2`

  # 🔑 Explicit env vars also work if set in shell/CI:
  #   ARM_SUBSCRIPTION_ID
  #   ARM_TENANT_ID
  #   ARM_CLIENT_ID
  #   ARM_CLIENT_SECRET
}
