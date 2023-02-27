module "kic" {
  source = "../module/cloud"

  # 입력 변수
  instance_name = "terraform-instance"
  instance_count = "1"
  default_network_cidr = ""
}
