# vms.tf
# DC01 and WIN11-CLIENT01 Virtual Machines

# ══════════════════════════════════════════════════════
# DC01 — Domain Controller (vnet-spoke1)
# ══════════════════════════════════════════════════════

resource "azurerm_network_interface" "dc01" {
  name                = "dc01-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "dc01-ipconfig"
    subnet_id                     = azurerm_subnet.spoke1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.1.1.4"
  }
}

resource "azurerm_windows_virtual_machine" "dc01" {
  name                = "DC01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = "Standard_D2s_v3"
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [azurerm_network_interface.dc01.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2025-datacenter-g2"
    version   = "latest"
  }
}

# ══════════════════════════════════════════════════════
# WIN11-CLIENT01 — Domain Client (vnet-spoke2)
# ══════════════════════════════════════════════════════

resource "azurerm_network_interface" "win11" {
  name                = "win11-client01-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "win11-ipconfig"
    subnet_id                     = azurerm_subnet.spoke2.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "win11" {
  name                = "WIN11-CLIENT01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = "Standard_D2s_v3"
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [azurerm_network_interface.win11.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-11"
    sku       = "win11-23h2-pro"
    version   = "latest"
  }
}
