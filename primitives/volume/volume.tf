resource "openstack_blockstorage_volume_v3" "db_storage" {
  count = var.db_count
  name = var.volume_name
  size = var.db_data_volume_size
}