variable "network_count" {
  type    = number
  default = 0
}

variable "network_name" {
  type    = string
  default = ""
}

variable "subnet_name" {
  type    = string
  default = "default-subnet"
}

variable "region_name" {
  type    = string
  default = ""
}

variable "admin_state_up" {
  type    = bool
  default = true
}

variable "external" {
  type    = bool
  default = false
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = []
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = []
}

variable "ip_version" {
  type    = string
  default = 4
}

variable "enable_dhcp" {
  type    = bool
  default = true
}

variable "dns_nameservers" {
  type    = list(string)
  default = ["8.8.8.8"]
}

variable "enable_nat_instance" {
  type    = bool
  default = false
}