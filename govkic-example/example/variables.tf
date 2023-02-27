variable "flavor_name" {
  type    = string
  default = "a1.2c2m"
}

variable "keypair_name" {
  type    = string
  default = "cbt-jason"
}

variable "image_name_ubuntu" {
  type    = string
  default = "Ubuntu18.04.6-Cloud"
}

variable "image_name_centos" {
  type    = string
  default = "CentOS7.9-Cloud"
}

variable "pub_subnet_cidr" {
  type    = string
  default = "192.168.1.0/24"
}

variable "priv_subnet_cidr" {
  type    = string
  default = "192.168.2.0/24"
}

variable "secgroup_name" {
  type    = string
  default = "jason-tf-secgroup"
}