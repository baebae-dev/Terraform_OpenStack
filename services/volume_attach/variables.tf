variable "prefix" {
  type = string
  default = ""
}

variable "port_name" {
  type    = string
  default = ""
}

variable "network_name" {
  type = string
  default = ""
}

variable "subnet_name" {
  type = string
  default = ""
}

variable "router_name" {
  type = string
  default = ""
}

variable "public_ip_network_name" {
  type    = string
  default = "ext-private-net1"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = []
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = []
}

variable "public_network_ids" {
  type    = list(string)
  default = []
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

variable "object_storage_user_name" {
  description = "openapi_user_name"
  type        = string
  sensitive   = true
}

variable "object_storage_name" {
  type    = string
  default = "tf-test-container"
}

variable "backend_address" {
  type    = string
  default = ""
}

variable "remote_state_name" {
  type    = string
  default = ""
}

variable "object_storage_user_password" {
  description = "openapi_user_password"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "tenant_id"
  type        = string
  sensitive   = true
}

variable "user_domain_name" {
  description = "user_domain_name"
  type        = string
  sensitive   = true
}

variable "sec_group_name_priv" {
  type    = string
  default = ""
}

variable "sec_group_name_pub" {
  type    = string
  default = ""
}

variable "keypair_name" {
  type    = string
  default = "tf-keypair"
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "instance_name" {
  type    = string
  default = "tf-instance"
}

variable "pub_instance_name" {
  type    = string
  default = "tf-pub-instance"
}

variable "volume_name" {
  type = string
  default = "tf-volume"
}

variable "volume_size" {
  type = number
  default = 500
  description = "number 500 = 500GB"
}

variable "volume_count" {
  type = number
  default = 1
}

variable "volume_path" {
  type = string
  default = "/dev/vdb"
}

variable "auth_url" {
  description = "auth_url"
  type        = string
  sensitive   = true
}

variable "endpoint_override_url" {
  description = "endpoint_override_url"
  type        = string
  sensitive   = true
}

variable "objectStorage_name" {
  type = string
  default = ""
}