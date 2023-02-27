env               = "prod"
default_network_cidr = "192.168.50.0/24"
# ${VPC_SUBNET_CIDR}은 IP CIDR 블록으로 카카오 i 클라우드 콘솔 > VPC > Subnet에서 사용할 수 있는 서브넷을 확인할 수 있습니다.
resource_count    = 2
instance_type     = "t3.medium"
instance_name = "terraform-instance"
instance_count = 1
instance_flavor = "a1-2-co"
default_image = "CentOS 7.9"
