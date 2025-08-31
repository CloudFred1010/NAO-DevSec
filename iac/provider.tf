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

  # ✅ Authentication happens automatically if:
  # - Locally: you ran `az login`
  # - In GitHub Actions: you used `azure/login@v1`

  # No need for subscription_id or tenant_id here if you export them:
  #   ARM_SUBSCRIPTION_ID
  #   ARM_TENANT_ID
  #   ARM_CLIENT_ID
  #   ARM_CLIENT_SECRET
}
