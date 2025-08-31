# ---------------------------
# Resource Group
# ---------------------------
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# ---------------------------
# Modules
# ---------------------------
module "acr" {
  source              = "./modules/acr"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  acr_name            = var.acr_name
}

module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  kv_name             = var.kv_name
}

module "appservice" {
  source              = "./modules/appservice"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  app_name            = var.app_name
  acr_login_server    = module.acr.acr_login_server
  kv_id               = module.keyvault.kv_id
  log_analytics_id    = module.logging.log_analytics_id
}

module "logging" {
  source              = "./modules/logging"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  log_analytics_name  = var.log_analytics_name
  app_name            = var.app_name              # ✅ Added fix
  app_service_id      = module.appservice.app_id
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
}
