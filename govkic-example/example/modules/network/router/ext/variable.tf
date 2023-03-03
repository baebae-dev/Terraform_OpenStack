variable "router_name" {
  type    = string
  default = ""
}

variable "region_name" {
  type    = string
  default = "RegionOne"
}

variable "admin_state_up" {
  type    = bool
  default = true
}

variable "external_network_id" {
  type    = string
  default = ""
}

variable "network_ids" {
  type    = list(string)
  default = []
}

variable "public_subnet_ids" {
  type    = list(string)
  default = []
}

variable "fixed_ip_address" {
  type    = string
  default = ""
}

variable "port_security_enabled" {
  type    = bool
  default = false
}
