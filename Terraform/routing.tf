# routing.tf
# Route Tables and User Defined Routes

# ── Route Table Spoke1 ────────────────────────────────
resource "azurerm_route_table" "spoke1" {
  name                          = "rt-spoke1"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  disable_bgp_route_propagation = true

  route {
    name                   = "to-spoke2"
    address_prefix         = "10.2.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.hub.ip_configuration[0].private_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "spoke1" {
  subnet_id      = azurerm_subnet.spoke1.id
  route_table_id = azurerm_route_table.spoke1.id
}

# ── Route Table Spoke2 ────────────────────────────────
resource "azurerm_route_table" "spoke2" {
  name                          = "rt-spoke2"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  disable_bgp_route_propagation = true

  route {
    name                   = "to-spoke1"
    address_prefix         = "10.1.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.hub.ip_configuration[0].private_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "spoke2" {
  subnet_id      = azurerm_subnet.spoke2.id
  route_table_id = azurerm_route_table.spoke2.id
}
