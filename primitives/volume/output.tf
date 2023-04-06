output "volume" {
  value = openstack_blockstorage_volume_v3.volume
}

output "volume_id" {
  value = openstack_blockstorage_volume_v3.volume.*.id
}