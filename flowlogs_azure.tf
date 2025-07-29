


# Use existing Network Watcher instead of creating a new one
# Azure allows only 1 Network Watcher per subscription per region
data "azurerm_network_watcher" "NetWatcher" {
  name                = "NetworkWatcher_westus"
  resource_group_name = "NetworkWatcherRG"
}

resource "random_string" "random" {
  length  = 8
  lower   = true
  numeric = false
  special = false
  upper   = false
}
resource "azurerm_storage_account" "flowlogs" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = random_string.random.id

  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
}