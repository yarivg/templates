terraform {
  required_providers {
    azapi = {
      source = "azure/azapi"
    }
  }
}

provider "azapi" {
}

resource "azurerm_resource_group" "example" {
  name     = "example-rg"
  location = "west europe"
}