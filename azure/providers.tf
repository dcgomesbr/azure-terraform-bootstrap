terraform {
  required_version = "~> 1.3"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.4"

    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  # this info is gathered from the bootstrap's output
  # backend block doesn't accept variables!
  backend "azurerm" {
    resource_group_name  = "terraform-bootstrap-qxcvsi9a"
    storage_account_name = "tfstateqxcvsi9a"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  # Set these variables through environment variables pulling from secrets in your CI/CD
  # Example: TF_VAR_azure_tenant_id="0000-0000-0000"
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
}