module "network" {
  source    = "../../modules/network"
  default_network_cidr  = var.default_network_cidr
  sub_count = var.resource_count
  env       = var.env
}

module "vm" {
  source = "../../modules/vm"
  vpc_id = var.default_network_cidr
  default_image = var.default_image
  instance_name = var.instance_name
  instance_count = var.instance_name
  instance_flavor = var.instance_flavor
}

