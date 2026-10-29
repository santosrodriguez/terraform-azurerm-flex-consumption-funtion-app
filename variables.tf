variable "app_service_plan_id" {
  type = string
}

variable "app_insights_connection_string" {
  type = string
  default = ""
}

variable "common_infra_subscription_id" {
  type = string
  default = "56bdaed4-70cf-4a28-8fb8-0efc135bb29f"
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "private_dns_zone_ids" {
  type = list(string)
  default = [ 
    "/subscriptions/56bdaed4-70cf-4a28-8fb8-0efc135bb29f/resourceGroups/rg-azuredns-prd-01/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net",
    "/subscriptions/56bdaed4-70cf-4a28-8fb8-0efc135bb29f/resourceGroups/rg-azuredns-prd-01/providers/Microsoft.Network/privateDnsZones/scm.privatelink.azurewebsites.net"
  ]
}

variable "private_endpoint_subnet_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "runtime_name" {
  type = string
}

variable "runtime_version" {
  type = string
}

variable "sku" {
  type = string
  default = "FC1"
}

variable "solution_name" {
  type = string
}

variable "storage_authentication_type" {
  type = string
}

variable "storage_container_endpoint_id" {
  type = string
}

variable "storage_container_type" {
  type = string
  default = "blobContainer"
}

variable "subscription_id" {
  type = string
}

variable "vnet_integration_subnet_id" {
  type = string
}
