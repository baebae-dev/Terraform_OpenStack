resource "openstack_compute_keypair_v2" "keypair" {
  count      = var.create_keypair ? 1:0
  name       = var.keypair_name
  region     = var.region_name
}