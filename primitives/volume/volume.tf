resource "openstack_blockstorage_volume_v3" "db_storage" {
  count = var.volume_count
  name = var.volume_name
  size = var.volume_size
}