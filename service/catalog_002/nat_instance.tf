#################################################################################
#
# Native OpenStack 기반 VPC 아키텍처 (like AWS VPC Concept) & NAT Instance
# https://wiki.daumkakao.com/pages/viewpage.action?pageId=969698602
#
#################################################################################

module "nat_instance" {
  source        = "../../primitives/compute/instance"

  count         = var.instance_nat_count
  instance_name = "${var.prefix}${var.instance_nat_name}-${count.index}"
  password      = var.password

  network_id    = module.vpc.public_network_ids[0]
  subnet_id     = module.vpc.public_subnet_ids[0]

  port_security_enabled = false
  sec_group_ids = [
    "87e501b8-b374-4299-bf62-d7869cfb6afb" // default security-group
  ]
  fixed_ip_address = "192.168.1.59"

  port_name = "${var.prefix}${var.instance_nat_name}-${count.index}"
  keypair_name = "${var.prefix}${var.keypair_name}"

  is_public = true
  public_ip_network_name = "ext-private-net1"

  depends_on = [
    module.vpc
  ]
}