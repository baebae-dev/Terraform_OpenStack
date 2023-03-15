variable "db_data_volume_size" {
  type = number
  default = 500
  description = "number 500 = 500GB"
}

variable "prefix" {
  type = string
  default = "bell-"
}

variable "db_count" {
  type = number
  default = 1
}
