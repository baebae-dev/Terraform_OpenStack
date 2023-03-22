# volume
module "volume" {
  source        = "../primitives/volume"

  volume_name = "${var.prefix}${var.volume_name}"
  volume_count         = var.volume_count
  volume_size = var.volume_size
}

# attaching volume to instance
# instance에 volume 붙이고 싶을 경우 주석 해제 후 사용
#resource "openstack_compute_volume_attach_v2" "volume_attach" {
#  count = var.volume_count
#  volume_id = module.volume.volume_id
#  instance_id = module.app_server.instance.id
#  device = var.volume_path
#}