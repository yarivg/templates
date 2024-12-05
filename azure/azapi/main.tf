terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.74" # Specify the version you want
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.8" # Specify the version you want
    }
  }
}


provider "azurerm" {
  features {}
}

provider "azapi" {
}

resource "azurerm_resource_group" "example" {
  name     = "example-rg"
  location = "west europe"
}