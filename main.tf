terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
skip_provider_registration = "true"
subscription_id = "c9cac4e4-7711-43df-a3a7-35f3b86a45ee"
features {}
}


# Create a resource group
resource "azurerm_resource_group" "terra-linux" {
  name     = "terra-linux-rg"
  location = "West Europe"
}

