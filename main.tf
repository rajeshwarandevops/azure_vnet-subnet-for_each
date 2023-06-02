# Source code for the Resource Group Creation
resource "azurerm_resource_group" "rg_prod" {
  name     = var.rg_name
  location = var.location
  tags     = local.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.address_space
  tags     = local.tags
}

resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet
  name                 = each.value["name"]
  resource_group_name  = each.value["resource_group_name"]
  virtual_network_name = each.value["virtual_network_name"]
  address_prefixes     = each.value["address_prefixes"]
  depends_on           = [azurerm_virtual_network.vnet]
  
}

locals {
  subnets = {
    for key, value in azurerm_subnet.subnet : key => value

  }
}
locals {
  tags = {
    env     = "prod"
    owner   = "Raejshwaran"
    project = "devopsforu"
  }
}
output "web_subnets" {
  value = lookup(local.subnets, "web_subnet")
}

output "db_subnets" {
  value = lookup(local.subnets, "db_subnet")
}

