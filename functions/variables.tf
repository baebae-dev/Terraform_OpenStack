variable "prefix" {
  type = string
  default = ""
}

variable "router_name" {
  type    = string
  default = ""
}

variable "subnet_name" {
  type    = string
  default = ""
}

variable "network_name" {
  type    = string
  default = ""
}

variable "public_subnet_cidrs" {
  type = list(string)
  default = ["192.168.1.0/24"]
}

variable "private_subnet_cidrs" {
  type = list(string)
  default = ["192.168.10.0/24"]
}

## nat_instance_ip과 routing_table_in_next_hops는 같아야함.
variable "nat_instance_ip" {
  type = string
  default = "192.168.10.0/24"
}

variable "routing_table_in_next_hops" {
  type = list(string)
  default = ["192.168.10.0/24"]
}

variable "routing_table_ext_next_hops" {
  type = list(string)
  default = ["192.168.1.1"]
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

variable "volume_count" {
  type = number
  default = 1
}

variable "volume_path" {
  type = string
  default = "/dev/vdb"
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "instance_id" {
  type = string
  default = ""
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

variable "remote_state_name" {
  type    = string
  default = ""
}

##### auth #####
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
