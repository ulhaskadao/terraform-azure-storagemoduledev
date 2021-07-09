resource "azurerm_resource_group" "tekram-rg1" {
  name     = var.resourcegroup
  location = "Central India"
}

resource "azurerm_storage_account" "tekram-sa" {
  name                     = var.storageaccount
  resource_group_name      = azurerm_resource_group.tekram-rg1.name
  location                 = azurerm_resource_group.tekram-rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tekram-sc" {
  name                  = var.containername
  storage_account_name  = azurerm_storage_account.tekram-sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "tekramblob" {
  name                   = "tekramblob"
  storage_account_name   = azurerm_storage_account.tekram-sa.name
  storage_container_name = azurerm_storage_container.tekram-sc.name
  type                   = "Block"
  source                 = "C:/Training/Demo5Modules/modules/storageaccount/Demo.zip"
}