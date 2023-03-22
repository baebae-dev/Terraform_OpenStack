module "keypair" {
  source       = "../../primitives/compute/keypair"
  keypair_name = "${var.prefix}${var.keypair_name}"
}