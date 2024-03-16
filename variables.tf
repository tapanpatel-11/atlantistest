variable "app" {
  description = "Atlantis for Github terraform automation"
  type    = string
  default = "rwg"
}

variable "env" {
  description = "Atlantis environment"
  type    = string
  default = "ops"
}

variable "location" {
  description = "Application Location"
  type    = string
  default = "eastus"
}

variable "vnet_cidr" {
  description = "Virtual Network CIDR"
  type = string
  default = "10.100.0.0/20"
}
