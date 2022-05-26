resource "azurerm_network_interface" "terra-linux" {
  name                = "terra-linux-nic"
  location            = azurerm_resource_group.terra-linux.location
  resource_group_name = azurerm_resource_group.terra-linux.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terra-linux.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terra-linux.id
  }
}

resource "azurerm_linux_virtual_machine" "terra-linux" {
  name                = "terra-linux-machine01"
  resource_group_name = azurerm_resource_group.terra-linux.name
  location            = azurerm_resource_group.terra-linux.location
  size                = "Standard_D2_v2"
  admin_username      = "trainer"
  network_interface_ids = [
    azurerm_network_interface.terra-linux.id,
  ]

  admin_ssh_key {
    username   = "trainer"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}