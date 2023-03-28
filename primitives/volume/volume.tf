resource "openstack_blockstorage_volume_v3" "volume" {
  count = var.volume_count
  name = var.volume_name
  size = var.volume_size
}

# attaching volume to instance
resource "openstack_compute_volume_attach_v2" "volume_attach" {
  count       = var.instance_count * var.volume_count
  volume_id   = element(openstack_blockstorage_volume_v3.volume.*.id, floor(count.index/var.instance_count))
  instance_id = element(var.instance_id, floor(count.index/var.volume_count))
  device = var.volume_path
}m