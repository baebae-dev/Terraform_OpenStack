# common
variable "prefix" {
  type = string
  default = ""
}

# vpc
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

variable "public_subnet_cidrs" {
  type    = list(string)
  default = []
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = []
}

variable "routing_table_in_next_hops" {
  type = list(string)
  default = []
}

variable "nat_instance_ip" {
  type = string
  default = ""
}

# openAPI
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

# remote state
variable "backend_address" {
  type    = string
  default = ""
}

variable "remote_state_name" {
  type    = string
  default = ""
}

variable "objectStorage_name" {
  type = string
  default = ""
}

# instance
variable "keypair_name" {
  type    = string
  default = ""
}

variable "create_keypair" {
  type = bool
  default = true
}

variable "instance_app_count" {
  type    = number
  default = 1
}

variable "instance_app_name" {
  type    = string
  default = ""
}

variable "instance_pub_count" {
  type    = number
  default = 1
}

variable "instance_pub_name" {
  type    = string
  default = ""
}

variable "instance_bastion_name" {
  type    = string
  default = ""
}

variable "instance_bastion_count" {
  type    = number
  default = 1
}

variable "instance_nat_name" {
  type = string
  default = ""
}

variable "instance_nat_count" {
  type    = number
  default = 1
}

variable "instance_db_name" {
  type    = string
  default = ""
}

variable "instance_db_count" {
  type    = number
  default = 1
}

variable "image_name" {
  type = string
  default = ""
}

variable "flavor_name" {
  type = string
  default = ""
}

variable "password" {
  type = string
  default = ""
}

# security-group
variable "security_group_name" {
  type = string
  default = ""
}

# volume
variable "volume_name" {
  type = string
  default = ""
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