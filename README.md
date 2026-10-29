# Azure Flex Consumption Function App Terraform Module

## Introduction
This module deploys an Azure Function App on the Flex Consumption plan with a private endpoint and private DNS A record.

## Usage

```hcl
module "flex_consumption_app" {
  source = "caresource.pe.jfrog.io/shared-tfmodules-internal__compute/flex-consumption-app/azurerm"
  version = "0.1.0"
  app_service_plan_id = "/subscriptions/../resourceGroups/../providers/Microsoft.Web/serverfarms/.."
  environment = var.environment
  location = var.location
  private_endpoint_subnet_id = "/subscriptions/../resourceGroups/../providers/Microsoft.Network/virtualNetworks/../subnets/.."
  resource_group_name = var.resource_group_name
  runtime_name = var.runtime_name # Options = python, java, dotnet-isolated, powershell, node, custom
  runtime_version = var.runtime_version # Version of runtime to use (eg.. .net8, 3.12, etc..)
  solution_name = var.solution_name
  storage_authentication_type = var.storage_authentication_type
  storage_container_endpoint_id = "/subscriptions/../resourceGroups/../providers/Microsoft.Storage/storageAccounts/../blobServices/default/containers/.."
  subscription_id = var.subscription_id
  vnet_integration_subnet_id = "/subscriptions/../resourceGroups/../providers/Microsoft.Network/virtualNetworks/../subnets/.."
}
```

## Inputs
| Name                                | Type           | Description                                        | Default    |
|--------------------------------------|----------------|----------------------------------------------------|------------|
| app_service_plan_id                  | string         | The ID of the App Service Plan the function app will run on. | n/a |
| environment                          | string         | The environment name (e.g. dev, test, prod), used in resource naming. | n/a |
| location                              | string         | The Azure location where the function app will be created. | n/a |
| private_endpoint_subnet_id           | string         | The subnet ID where the private endpoint for the function app will be created. | n/a |
| resource_group_name                  | string         | The name of the resource group in which to create the function app. | n/a |
| runtime_name                         | string         | The runtime stack of the function app (e.g. dotnet-isolated, node, java). | n/a |
| runtime_version                      | string         | The version of the runtime stack used by the function app. | n/a |
| solution_name                        | string         | The name of the solution, used in resource naming. | n/a |
| storage_authentication_type          | string         | The authentication method used by the function app to access the storage account. | n/a |
| storage_container_endpoint_id        | string         | The endpoint of the storage container used to store the function app's deployment package. | n/a |
| subscription_id                      | string         | The Azure subscription ID in which the function app is deployed. | n/a |
| vnet_integration_subnet_id           | string         | The subnet ID used for the function app's virtual network integration. | n/a |

## Outputs
| Name                                  | Description                              |
|-----------------------------------------|-------------------------------------------|
| app_id                                   | The resource ID of the Flex Consumption function app. |
| app_name                                 | The name of the Flex Consumption function app. |
| managed_identity_id                      | The principal ID of the function app's system-assigned managed identity. |

## Features

- Creates an Azure Function App on the Flex Consumption plan with a system-assigned managed identity
- Generates a random suffix to help ensure a unique function app name
- Disables public network access and enforces HTTPS-only traffic
- Deploys a private endpoint and a matching private DNS A record for the function app

## Requirements

- Terraform >= 1.4.0
- AzureRM >= 3.0
