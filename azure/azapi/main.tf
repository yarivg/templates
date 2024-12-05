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

resource "azapi_resource" "yariv_example_resource_group" {
  type     = "Microsoft.Resources/resourceGroups@2022-09-01" # ARM API for Resource Groups
  name     = "yariv-example-resource-group"
  location = "East US"

  body = jsonencode({
    properties = {} # Resource groups do not have additional properties
  })
}