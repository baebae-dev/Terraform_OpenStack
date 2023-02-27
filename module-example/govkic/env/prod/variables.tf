variable "env" {
  description = "env name"
  type        = string
}

variable "default_network_cidr" {
  description = "vpc cidr"
  type        = string
}

variable "resource_count" {
  description = "resource count"
  type        = number
}

variable "instance_type" {
  description = "instance type"
  type        = string
}

variable "default_image" {
  description = "default image = CentOS 7.9"
  type        = string
}

variable "instance_name" {
  description = "instance name"
  type        = number
}

variable "instance_flavor" {
  description = "instance flavor"
  type        = string
}