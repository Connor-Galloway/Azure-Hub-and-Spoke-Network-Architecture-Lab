# Configure Terraform to use Azure Storage for state file
terraform {
  backend "azurerm" {
    resource_group_name  = "rghubspoke-tfstate"
    storage_account_name = "tfstateconnor12345"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}