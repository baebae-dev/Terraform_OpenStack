resource "openstack_compute_keypair_v2" "keypair" {
  name       = var.keypair_name
  region     = var.region_name
}