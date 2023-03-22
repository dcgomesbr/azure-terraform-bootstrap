terraform {
  required_version = "~> 1.3"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.4"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  # configure some restricted place to host this state
  #backend "something" {}
}

# REMEMBER to `az login` before init and plan in this workspace
provider "azurerm" {
  features {}
}