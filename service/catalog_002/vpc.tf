module "vpc" {
  source = "../../primitives/network/vpc"

  network_name         = "${var.prefix}${var.network_name}"
  subnet_name          = "${var.prefix}${var.subnet_name}"
  router_name          = "${var.prefix}${var.router_name}"

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  external_network_id  = "a48f21af-04fe-4559-8085-a2bb0ae485ca"
}
