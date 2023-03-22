locals {
  keypair_name = "jason-tf-keypair"
}

module "keypair" {
  source = "../../primitives/compute/keypair"

  keypair_name = local.keypair_name
  region_name  = "RegionOne"
}

module "instance_web" {
  source = "../../primitives/compute/instance"

  count         = 1
  instance_name = "jason-tf-instance-pub-web"

  network_id    = module.vpc.public_network_ids[0]
  subnet_id     = module.vpc.public_subnet_ids[0]

  port_security_enabled = true
  sec_group_ids = [
    module.sg_priv.sec_group_id
  ]

  port_name = "jason-tf-instance-priv-port"
  keypair_name = local.keypair_name
}

module "instance_app" {
  source = "../../primitives/compute/instance"

  count         = 1
  instance_name = "jason-tf-instance-priv-app"

  network_id    = module.vpc.private_network_ids[0]
  subnet_id     = module.vpc.private_subnet_ids[0]

  port_security_enabled = true
  sec_group_ids = [
    module.sg_priv.sec_group_id
  ]

  port_name = "jason-tf-instance-priv-port"
  keypair_name   = local.keypair_name
}

module "instance_db" {
  source = "../../primitives/compute/instance"

  count         = 1
  instance_name = "jason-tf-instance-priv-db"

  network_id    = module.vpc.private_network_ids[1]
  subnet_id     = module.vpc.private_subnet_ids[1]

  port_security_enabled = true
  sec_group_ids = [
    module.sg_priv.sec_group_id
  ]

  port_name = "jason-tf-instance-priv-port"
  keypair_name   = local.keypair_name
}