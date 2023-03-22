variable "prefix" {
  type = string
  default = "bell-"
}

variable "router_name" {
  type    = string
  default = "tf-router"
}

variable "subnet_name" {
  type    = string
  default = "tf-subnet"
}

variable "network_name" {
  type    = string
  default = "tf-network"
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
  default = "192.168.0.59"
}

variable "routing_table_in_next_hops" {
  type = list(string)
  default = ["192.168.0.59"]
}

variable "routing_table_ext_next_hops" {
  type = list(string)
  default = ["192.168.0.254"]
}

variable "object_storage_name" {
  type    = string
  default = "tf-test-container"
}

variable "priv_instance_name" {
  type    = string
  default = "priv-vm"
}

variable "pub_instance_name" {
  type    = string
  default = "pub-vm"
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

variable "volume_name" {
  type = string
  default = "tf-volume"
}

variable "volume_size" {
  type = number
  default = 500
  description = "number 500 = 500GB"
}

variable "sec_group_name_pub" {
  type    = string
  default = "sg-pub"
}

variable "sec_group_name_priv" {
  type    = string
  default = "sg-priv"
}

variable "sec_group_name_bastion" {
  type    = string
  default = "sg-bastion"
}

variable "remote_state_name" {
  type    = string
  default = "remote-state"
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
