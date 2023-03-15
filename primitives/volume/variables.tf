variable "volume_size" {
  type = number
  default = 500
  description = "number 500 = 500GB"
}

variable "volume_name" {
  type = string
  default = "volume"
}

variable "volume_count" {
  type = number
  default = 1
}
