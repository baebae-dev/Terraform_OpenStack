module "kic" {
  source = "../module/cloud"

  # 입력 변수
  instance_name = "terraform-instance"
  instance_count = "1"
  default_network_cidr = "192.168.50.0/24"
}
