variable "instance_name" {
  type    = string
  default = "default-instance"
}

variable "port_name" {
  type    = string
  default = ""
}

variable "region_name" {
  type    = string
  default = "RegionOne"
}

variable "image_name" {
  type    = string
  default = "Ubuntu18.04.6-Cloud"
}

variable "flavor_name" {
  type    = string
  default = "a1.2c2m"
}

variable "create_keypair" {
  type    = bool
  default = false
}

variable "keypair_name" {
  type    = string
  default = ""
}

variable "network_id" {
  type    = string
  default = ""
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "sec_group_ids" {
  type    = list(string)
  default = []
}

variable "block_device_volume_size" {
  type    = number
  default = 0
}

variable "block_device_delete_on_termination" {
  type    = bool
  default = false
}

variable "admin_state_up" {
  type    = bool
  default = true
}

variable "fixed_ip_address" {
  type    = string
  default = null
}

variable "is_public" {
  type    = bool
  default = false
}

variable "public_ip_network_name" {
  type    = string
  default = null
}

variable "port_security_enabled" {
  type    = bool
  default = true
}