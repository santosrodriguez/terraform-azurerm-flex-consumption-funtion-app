terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

resource "random_string" "suffix" {
  length = 4
  upper = false
  numeric = false
  special = false
}

resource "azurerm_function_app_flex_consumption" "flex_consumption_app" {
  name = "func-${var.solution_name}-${var.location}-${var.environment}-${random_string.suffix.result}"
  resource_group_name = var.resource_group_name
  location = var.location
  runtime_name = var.runtime_name
  runtime_version = var.runtime_version
  service_plan_id = var.app_service_plan_id
  storage_authentication_type = var.storage_authentication_type
  storage_container_type = var.storage_container_type
  storage_container_endpoint = var.storage_container_endpoint_id
  https_only = true
  public_network_access_enabled = false
  virtual_network_subnet_id = var.vnet_integration_subnet_id
  identity {
    type = "SystemAssigned"
  }
  site_config {}
}

resource "azurerm_private_endpoint" "func_app_pep" {
  name = "pep-${azurerm_function_app_flex_consumption.flex_consumption_app.name}"
  resource_group_name = azurerm_function_app_flex_consumption.flex_consumption_app.resource_group_name
  location = var.location
  subnet_id = var.private_endpoint_subnet_id
  private_service_connection {
    is_manual_connection = false
    name = "psc-${azurerm_function_app_flex_consumption.flex_consumption_app.name}"
    private_connection_resource_id = azurerm_function_app_flex_consumption.flex_consumption_app.id
    subresource_names = [
      "sites"
    ]
  }
  private_dns_zone_group {
    name = "default"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  depends_on = [ 
    azurerm_function_app_flex_consumption.flex_consumption_app 
  ]
}
