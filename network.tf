# Create a virtual network within the resource group
resource "azurerm_virtual_network" "terra-linux" {
  name                = "terra-linux-vnet"
  resource_group_name = azurerm_resource_group.terra-linux.name
  location            = azurerm_resource_group.terra-linux.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "terra-linux" {
  name                 = "SubnetA"
  resource_group_name  = azurerm_resource_group.terra-linux.name
  virtual_network_name = azurerm_virtual_network.terra-linux.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "terra-linux" {
  name                = "terra-linux-maquina01"
  resource_group_name = azurerm_resource_group.terra-linux.name
  location            = azurerm_resource_group.terra-linux.location
  allocation_method   = "Static"
}