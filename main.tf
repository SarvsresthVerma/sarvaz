terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.36.0"
    }
  }
}

provider "azurerm" {
  features {}
subscription_id = "45d2c8fb-faba-4dc1-ab43-5ad9451eef1c"
}

resource "azurerm_resource_group" "rg1" {
  name     = "rg101"
  location = "West Europe"
  }

  resource "azurerm_resource_group" "rg2" {
  name     = "rg102"
  location = "West Europe"
  }


  resource "azurerm_storage_account" "sg1" {
  name                     = "stg101"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  }

resource "azurerm_storage_account" "sg2" {
  depends_on = [ azurerm_resource_group.rg2 ]
  name                     = "stg102"
  resource_group_name      = "rg102"
  location                 = "West Europe"
  
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
