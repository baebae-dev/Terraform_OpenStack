# volume
module "volume" {
  source       = "../../primitives/volume"

  volume_name  = "${var.prefix}${var.volume_name}"
  volume_count = var.volume_count
  volume_size  = var.volume_size
  volume_path  = var.volume_path
  instance_id  = module.app_server[*].instance_id[0]
  instance_count  = var.instance_count
}