variable "vnet" {
  type = object({
    name = string
  })
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where the virtual network will be created"
}

variable "location" {
  type        = string
  description = "Location for the virtual network"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the virtual network"
}

variable "dns_servers" {
  type        = list(string)
  description = "DNS servers for the virtual network"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the virtual network"
}

variable "bgp_community" {
  type        = string
  description = "BGP community for the virtual network"
}

variable "edge_zone" {
  type        = string
  description = "Edge zone for the virtual network"
  default = null
}

variable "flow_timeout_in_minutes" {
  type        = number
  description = "Flow timeout in minutes for the virtual network"
}

variable "ddos_protection_plan" {
  type = list(object({
    id     = string
    enable = bool
  }))
  description = "DDoS protection plan for the virtual network"
  default = []
}

variable "encryption" {
  type = list(object({
    enforcement = string
  }))
  description = "Encryption enforcement for the virtual network"
}

variable "subnet" {
  description = "number of subnet configurations"
  type = list(object({
    name           = string
    address_prefix = string
    service_endpoints      = optional(list(string))
    network_security_group = optional(list(string))
    delegation = optional(list(object({
      name         = string
      service_name = string
      actions      = optional(list(string))
    })))
  }))
}
