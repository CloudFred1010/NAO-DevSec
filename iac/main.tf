# ---------------------------
# Resource Group (imported, do not recreate)
# ---------------------------
data "azurerm_resource_group" "main" {
  name = "nao-juice-rg"
}

# ---------------------------
# Modules
# ---------------------------

# Container Registry
module "acr" {
  source              = "./modules/acr"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  acr_name            = var.acr_name
}

# Key Vault
module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  kv_name             = var.kv_name
}

# App Service
module "appservice" {
  source              = "./modules/appservice"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  app_name            = var.app_name

  # Inputs from other modules
  acr_login_server    = module.acr.acr_login_server
  kv_id               = module.keyvault.kv_id
  log_analytics_id    = module.logging.log_analytics_id
}

# Logging / Diagnostics
module "logging" {
  source              = "./modules/logging"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  log_analytics_name  = var.log_analytics_name

  # Inputs from other modules
  app_name            = var.app_name
  app_service_id      = module.appservice.app_id
}

# Network Security
module "network" {
  source              = "./modules/network"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  # 👇 Required fix: pass in admin IP
  admin_ip            = var.admin_ip
}
