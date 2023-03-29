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

variable "volume_path" {
  type = string
  default = "/dev/vdb"
}

variable "instance_id" {
  type = list(string)
  default = []
}

variable "instance_count" {
  type    = number
  default = 1
}
