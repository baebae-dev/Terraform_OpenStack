variable "region_name" {
  type    = string
  default = ""
}

variable "router_id" {
  type    = string
  default = ""
}

variable "destination_cidrs" {
  type    = list(string)
  default = []
}

variable "next_hops" {
  type    = list(string)
  default = []
}