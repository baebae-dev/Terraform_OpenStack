variable "sec_group_name" {
  type    = string
  default = ""
}

variable "description" {
  type    = string
  default = ""
}

variable "rules" {
  type    = list(map(any))
  default = []
}

variable "remote_ip_prefix" {
  type    = string
  default = ""
}