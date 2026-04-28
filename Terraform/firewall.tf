# firewall.tf
# Azure Firewall, Public IP, and Network Rule Collection

# ── Public IP ─────────────────────────────────────────
resource "azurerm_public_ip" "firewall" {
  name                = "fw-hub-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# ── Azure Firewall ────────────────────────────────────
resource "azurerm_firewall" "hub" {
  name                = "fw-hub"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "fw-ipconfig"
    subnet_id            = azurerm_subnet.firewall.id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }
}

# ── Network Rule Collection ───────────────────────────
resource "azurerm_firewall_network_rule_collection" "allow_ad_traffic" {
  name                = "allow-ad-traffic"
  azure_firewall_name = azurerm_firewall.hub.name
  resource_group_name = azurerm_resource_group.rg.name
  priority            = 100
  action              = "Allow"

  rule {
    name                  = "allow-dns"
    protocols             = ["TCP", "UDP"]
    source_addresses      = ["10.2.0.0/16"]
    destination_addresses = ["10.1.0.0/16"]
    destination_ports     = ["53"]
  }

  rule {
    name                  = "allow-kerberos"
    protocols             = ["TCP", "UDP"]
    source_addresses      = ["10.2.0.0/16"]
    destination_addresses = ["10.1.0.0/16"]
    destination_ports     = ["88"]
  }

  rule {
    name                  = "allow-rpc"
    protocols             = ["TCP"]
    source_addresses      = ["10.2.0.0/16"]
    destination_addresses = ["10.1.0.0/16"]
    destination_ports     = ["135"]
  }

  rule {
    name                  = "allow-ldap"
    protocols             = ["TCP", "UDP"]
    source_addresses      = ["10.2.0.0/16"]
    destination_addresses = ["10.1.0.0/16"]
    destination_ports     = ["389"]
  }

  rule {
    name                  = "allow-smb"
    protocols             = ["TCP"]
    source_addresses      = ["10.2.0.0/16"]
    destination_addresses = ["10.1.0.0/16"]
    destination_ports     = ["445"]
  }

  rule {
    name                  = "allow-rpc-dynamic"
    protocols             = ["TCP"]
    source_addresses      = ["10.2.0.0/16"]
    destination_addresses = ["10.1.0.0/16"]
    destination_ports     = ["49152-65535"]
  }
}
