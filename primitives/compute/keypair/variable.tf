variable "keypair_name" {
  type    = string
  default = ""
}

variable "create_keypair" {
  type = bool
  default = true
}

variable "region_name" {
  type    = string
  default = "RegionOne"
}