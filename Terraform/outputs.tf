# outputs.tf

output "firewall_private_ip" {
  description = "Private IP address of the Azure Firewall"
  value       = azurerm_firewall.hub.ip_configuration[0].private_ip_address
}

output "firewall_public_ip" {
  description = "Public IP address of the Azure Firewall"
  value       = azurerm_public_ip.firewall.ip_address
}

output "bastion_public_ip" {
  description = "Public IP address of Azure Bastion"
  value       = azurerm_public_ip.bastion.ip_address
}

output "dc01_private_ip" {
  description = "Private IP address of DC01"
  value       = azurerm_network_interface.dc01.private_ip_address
}

output "win11_private_ip" {
  description = "Private IP address of WIN11-CLIENT01"
  value       = azurerm_network_interface.win11.private_ip_address
}
