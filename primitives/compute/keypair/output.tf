output "keypair_name" {
  value = openstack_compute_keypair_v2.keypair[0].name
}