variable "public_network_ids" {
  type    = list(string)
  default = []
}

variable "prefix" {
  type = string
  default = "bell-"
}

variable "object_storage_name" {
  type    = string
  default = "tf-test-container"
}

variable "instance_name" {
  type    = string
  default = "tf-instance-app"
}

variable "bastion_instance_name" {
  type    = string
  default = "tf-bastion-instance"
}
variable "nat_instance_name" {
  type = string
  default = "tf-nat-instance"
}

variable "port_name" {
  type    = string
  default = "tf-port"
}

variable "keypair_name" {
  type    = string
  default = "tf-keypair"
}

variable "db_count" {
  type = number
  default = 1
}

variable "volume_name" {
  type = string
  default = "tf-volume"
}

variable "db_data_volume_size" {
  type = number
  default = 500
  description = "number 500 = 500GB"
}

variable "tenant_id" {
  description = "tenant_id"
  type        = string
  sensitive   = true
}

variable "auth_url" {
  description = "auth_url"
  type        = string
  sensitive   = true
}

variable "user_domain_name" {
  description = "user_domain_name"
  type        = string
  sensitive   = true
}

variable "object_storage_user_name" {
  description = "openapi_user_name"
  type        = string
  sensitive   = true
}

variable "object_storage_user_password" {
  description = "openapi_user_password"
  type        = string
  sensitive   = true
}

variable "openapi_user_name" {
  description = "openapi_user_name"
  type        = string
  sensitive   = true
}

variable "openapi_user_password" {
  description = "openapi_user_password"
  type        = string
  sensitive   = true
}

variable "public_ip_network_name" {
  type    = string
  default = null
}

variable "sec_group_name_pub" {
  type    = string
  default = ""
}

variable "sec_group_name_priv" {
  type    = string
  default = ""
}

variable "sec_group_name_bastion" {
  type    = string
  default = ""
}
