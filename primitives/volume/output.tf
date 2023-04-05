output "volume" {
  value = openstack_blockstorage_volume_v3.volume
}

output "volume_id" {
  value = openstack_blockstorage_volume_v3.volume.*.id
}

output "volume_devices" {
  value = openstack_compute_volume_attach_v2.volume_attach.*.device
}

output "volume_attach_instance_id" {
  value = openstack_compute_volume_attach_v2.volume_attach.*.instance_id
}