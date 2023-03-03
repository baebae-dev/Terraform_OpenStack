module "keypair" {
  source       = "./modules/compute/keypair"
  keypair_name = "jason-tf-keypair"
}

module "web_server" {
  source        = "./modules/compute/instance"

  count         = 2
  instance_name = "jason-tf-instance-web-${count.index}"
  keypair_name  = module.keypair.keypair_name

  network_id    = module.network.public_network_ids[0]
  subnet_id     = module.network.public_subnet_ids[0]

  sec_group_ids = [
    module.sg_pub.sec_group_id
  ]

  port_name = "jason-tf-port-${count.index}"
  is_public = true
  public_ip_network_name = "ext-private-net1"
}

module "app_server" {
  source        = "./modules/compute/instance"

  count         = 3
  instance_name = "jason-tf-instance-app-${count.index}"
  keypair_name  = module.keypair.keypair_name

  network_id    = module.network.private_network_ids[0]
  subnet_id     = module.network.private_subnet_ids[0]

  sec_group_ids = [
    module.sg_pub.sec_group_id
  ]

  port_name = "jason-tf-port-${count.index}"
}