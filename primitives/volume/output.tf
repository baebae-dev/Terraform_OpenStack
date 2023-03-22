output "volume_name" {
  value = openstack_blockstorage_volume_v3.volume.name
}

output "volume_id" {
  value = openstack_blockstorage_volume_v3.volume.id
}