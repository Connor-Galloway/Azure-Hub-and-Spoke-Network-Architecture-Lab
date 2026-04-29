# backend.tf
# Configure Terraform to use Azure Storage for state file

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-hubspoke-lab"
    storage_account_name = "tfstate3847"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
