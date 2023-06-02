variable "vnet_name" {
  type    = string
  default = "vnet-prod"
}

variable "rg_name" {
  type    = string
  default = "rg-prod"
}

variable "location" {
  type    = string
  default = "UAE NORTH"
}

variable "address_space" {
  type    = list(any)
  default = ["10.0.0.0/16"]
}

variable "subnet" {
  description = "Map of Azure VNET subnet configuration"
  type        = map(any)
  default = {
    web_subnet = {
      name                 = "web_subnet"
      resource_group_name  = "rg-prod"
      virtual_network_name = "vnet-prod"
      address_prefixes     = ["10.0.1.0/24"]
    },
    db_subnet = {
      name                 = "db_subnet"
      resource_group_name  = "rg-prod"
      virtual_network_name = "vnet-prod"
      address_prefixes     = ["10.0.2.0/24"]
    }
  }
}


/* variable "tags" {
  default = {
    env     = "prod"
    owner   = "Raejshwaran"
    project = "devopsforu"
  }

} */