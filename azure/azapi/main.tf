terraform {
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "1.8.0" # Specify the appropriate version
    }
  }
}

provider "azapi" {}

resource "azapi_resource" "example_resource_group" {
  type     = "Microsoft.Resources/resourceGroups@2022-09-01" # Resource Group ARM API version
  name     = "example-resource-group"
  location = "East US"

  body = jsonencode({
    properties = {} # Resource groups do not have additional properties
  })
}

resource "azapi_resource" "example_storage_account" {
  type      = "Microsoft.Storage/storageAccounts@2022-09-01" # Storage Account ARM API version
  name      = "examplestorageacct"
  location  = azapi_resource.example_resource_group.location
  parent_id = azapi_resource.example_resource_group.id

  body = jsonencode({
    sku = {
      name = "Standard_LRS"
    }
    kind     = "StorageV2"
    properties = {}
  })
}