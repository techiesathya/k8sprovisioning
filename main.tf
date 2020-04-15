# Providers
provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  version         = "=1.44.0"
}

provider "azuread" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  version         = "~>0.3"

}

terraform {
  backend "azurerm" {
    resource_group_name  = "tstate"
    storage_account_name = "tstate5983"
    container_name       = "tstate"
    key                  = "terraform.tfstate"
  }
}

module "rg" {
  source   = "./modules/rg/"
  name     = format("sg-rg-k8s-%s", var.stage)
  location = var.primary_location
  tags     = local.default_tags

}

module "app_registration" {
  source          = "./modules/identity/aad/app_registration"
  name            = "sp01"
  identifier_uris = [format("https://%s", var.application_name)]
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = format("sg-rg-k8s-%s", var.stage)
  name                = "sgk8sacr01"
  location            = var.primary_location
  tags                = local.default_tags
}

module "acr_roleassignment" {
  source               = "./modules/identity/aad/roleassignments"
  scope                = module.acr.service_principal
  role_definition_name = "AcrPull"
  principal_id         = module.app_registration.service_principal
}

module "k8s" {
  source                          = "./modules/k8s"
  name                            = "sg-aks-poc01"
  location                        = var.primary_location
  resource_group_name             = format("sg-rg-k8s-%s", var.stage)
  service_principal_client_id     = module.app_registration.application_id
  service_principal_client_secret = module.app_registration.app_registration_password
  tags                            = local.default_tags
  node_poolname                   = "nodepool01"
  vm_size                         = "Standard_D2s_v3"
}


output "mainoutput" {
  value     = module.app_registration.app_registration_password
  sensitive = true
}
