module "instance_app" { # private
  source = "../../primitives/compute/instance"

  count         = var.instance_app_count
  instance_name = "${var.prefix}${var.instance_app_name}-${count.index}"
  image_name    = var.image_name
  flavor_name   = var.flavor_name
  password      = var.password

  network_id    = module.vpc.private_network_ids[0]
  subnet_id     = module.vpc.private_subnet_ids[0]

  port_security_enabled = true
  sec_group_ids = [
#    module.sg_priv.sec_group_id,
    "87e501b8-b374-4299-bf62-d7869cfb6afb" // default security-group
  ]

  port_name = "${var.prefix}${var.instance_app_name}-port"
  keypair_name = "${var.prefix}${var.keypair_name}"

  depends_on = [
    module.vpc
  ]
}

module "instance_pub" {
  source = "../../primitives/compute/instance"

  count         = var.instance_pub_count
  instance_name = "${var.prefix}${var.instance_pub_name}-${count.index}"
  image_name    = var.image_name
  flavor_name   = var.flavor_name
  password      = var.password

  network_id    = module.vpc.public_network_ids[0]
  subnet_id     = module.vpc.public_subnet_ids[0]

  port_security_enabled = true
  sec_group_ids = [
    module.sg_pub.sec_group_id,
    "87e501b8-b374-4299-bf62-d7869cfb6afb" // default security-group
  ]

  is_public = true
  public_ip_network_name = "ext-private-net1"

  port_name = "${var.prefix}${var.instance_pub_name}-port"
  keypair_name = "${var.prefix}${var.keypair_name}"

  depends_on = [
    module.vpc
  ]
}