# keyvault.tf
# Azure Key Vault for storing sensitive credentials

# Generate a random suffix for Key Vault name (must be globally unique)
resource "random_string" "keyvault_suffix" {
  length  = 6
  special = false
  lower   = true
}

# Key Vault (Standard tier - lowest cost)
resource "azurerm_key_vault" "hub" {
  name                        = "kv-hubspoke-${random_string.keyvault_suffix.result}"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  # Access policy for current user/account running Terraform
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List",
    ]

    secret_permissions = [
      "Get",
      "Set",
      "Delete",
      "List",
      "Purge",
    ]

    certificate_permissions = [
      "Get",
      "List",
    ]
  }
}

# Store admin password in Key Vault
resource "azurerm_key_vault_secret" "admin_password" {
  name         = "admin-password"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.hub.id
}

# Data source to get current Azure context
data "azurerm_client_config" "current" {}
