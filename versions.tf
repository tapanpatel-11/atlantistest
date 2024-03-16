terraform {
  required_version = ">=1.6.1"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.62.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.3.2"
    }
  }

  backend "azurerm" {
    resource_group_name  = "atlantis"
    storage_account_name = "terraformstateatlantis"
    container_name       = "tfstate"
    key                  = "atlantis.tfstate"
  }
}
provider "azurerm" {
   features {}
}
