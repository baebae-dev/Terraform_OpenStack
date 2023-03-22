locals {
  keypair_name = "jason-tf-keypair"
}

module "keypair" {
  source = "../../primitives/compute/keypair"

  keypair_name = local.keypair_name
  region_name  = "RegionOne"
}

module "instance_bastion" {
  source = "../../primitives/compute/instance"

  count         = 1
  instance_name = "jason-tf-instance-pub-web"
  image_name    = "Ubuntu18.04.6-Cloud"
  flavor_name    = "a1.4c4m"

  network_id    = module.vpc.public_network_ids[0]
  subnet_id     = module.vpc.public_subnet_ids[0]

  port_security_enabled = true
  sec_group_ids = [
    module.sg_bastion.sec_group_id
  ]

  port_name    = "jason-tf-instance-bastion-port"
  keypair_name = local.keypair_name
  public_ip_network_name = "jason-tf-network-public"
}

module "instance_app" {
  source = "../../primitives/compute/instance"

  count         = 1
  instance_name = "jason-tf-instance-priv-app"
  image_name    = "Ubuntu18.04.6-Cloud"
  flavor_name    = "a1.2c2m"

  network_id    = module.vpc.private_network_ids[0]
  subnet_id     = module.vpc.private_subnet_ids[0]

  port_security_enabled = true
  sec_group_ids = [
    module.sg_priv.sec_group_id
  ]

  port_name = "jason-tf-instance-app-port"
  keypair_name   = local.keypair_name
}

module "instance_db" {
  source = "../../primitives/compute/instance"

  count         = 1
  instance_name = "jason-tf-instance-priv-db"
  image_name    = "Ubuntu18.04.6-Cloud"
  flavor_name    = "a1.2c2m"

  network_id    = module.vpc.private_network_ids[1]
  subnet_id     = module.vpc.private_subnet_ids[1]

  port_security_enabled = true
  sec_group_ids = [
    module.sg_priv.sec_group_id
  ]

  port_name = "jason-tf-instance-db-port"
  keypair_name   = local.keypair_name
}