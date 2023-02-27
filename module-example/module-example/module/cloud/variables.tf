variable "default_image" {
  type    = string
  default = "CentOS 7.9"
}

variable "default_network_cidr" {
  type    = string
}
# ${VPC_SUBNET_CIDR}은 IP CIDR 블록으로 카카오 i 클라우드 콘솔 > VPC > Subnet에서 사용할 수 있는 서브넷을 확인할 수 있습니다.

variable "instance_name" {
  type    = string
  default = "simple-instance"
  sensitive   = true
  description = "instance name"
}

variable "instance_count" {
  type    = number
  default = 1
  sensitive   = true
  description = "instance count"
}

variable "instance_flavor" {
  type    = string
  default = "a1-2-co"
}