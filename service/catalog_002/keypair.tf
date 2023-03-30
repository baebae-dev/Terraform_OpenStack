module "keypair" {
  source       = "../../primitives/compute/keypair"
  count  = var.create_keypair ? 1:0
  keypair_name  = var.keypair_name
}
