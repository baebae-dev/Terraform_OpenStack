variable "db_data_volume_size" {
  type = number
  default = 500
  description = "number 500 = 500GB"
}

variable "volume_name" {
  type = string
  default = "volume"
}

variable "db_count" {
  type = number
  default = 1
}
