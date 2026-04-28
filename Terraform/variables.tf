# variables.tf

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-hubspoke-lab"
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "centralus"
}

variable "admin_username" {
  description = "Administrator username for both VMs"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "Administrator password for both VMs"
  type        = string
  sensitive   = true
}
