#################################################################################
#
# Native OpenStack 기반 VPC 아키텍처 (like AWS VPC Concept) & NAT Instance
# https://wiki.daumkakao.com/pages/viewpage.action?pageId=969698602
#
#################################################################################

module "nat_instance" {
  source        = "../primitives/compute/instance"

  count         = 1
  instance_name = "${var.prefix}${var.nat_instance_name}}-${count.index}"
  keypair_name  = module.keypair.keypair_name

  network_id    = module.vpc.public_network_ids[0]
  subnet_id     = module.vpc.public_subnet_ids[0]

  port_security_enabled = false
  fixed_ip_address = "192.168.1.254"

  port_name = "${var.prefix}${var.port_name}-${count.index}"
  is_public = true
  public_ip_network_name = "${var.prefix}${var.public_ip_network_name}"
}