terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  backend "remote" {
    organization = "phish-factory"
    workspaces {
      name = "phish-factory"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "eastus"

  tags = {
    Enviorment = "Phish Farm"
    Team = "DevOps"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "pfVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg.name
}
