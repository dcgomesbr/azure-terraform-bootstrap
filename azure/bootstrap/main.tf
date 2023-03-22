data "azuread_client_config" "current" {}

resource "azuread_application" "terraform_bootstrap" {
  api {
    requested_access_token_version = 2
  }

  display_name     = "terraform-bootstrap"
  sign_in_audience = "AzureADandPersonalMicrosoftAccount"
  owners           = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "terraform_bootstrap" {
  application_id               = azuread_application.terraform_bootstrap.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "random_string" "rg" {
  length  = 8
  upper   = false
  special = false
}

resource "azurerm_resource_group" "rg" {
  name     = "terraform-bootstrap-${random_string.rg.result}"
  location = var.location
}

resource "azurerm_storage_account" "tfstate" {
  name                            = "tfstate${random_string.rg.result}"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}