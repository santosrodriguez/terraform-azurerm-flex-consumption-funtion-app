output "app_id" {
  value = azurerm_function_app_flex_consumption.flex_consumption_app.id
}

output "app_name" {
  value = azurerm_function_app_flex_consumption.flex_consumption_app.name
}

output "managed_identity_id" {
  value = azurerm_function_app_flex_consumption.flex_consumption_app.identity[0].principal_id
}
