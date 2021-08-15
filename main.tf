terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }

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



provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "eastus"

  tags = {
    Enviormen = "Phish Farm"
    Team = "DevOps"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "pfVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg.name
}
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}