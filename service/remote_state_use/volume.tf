# volume
module "volume" {
  source       = "../../primitives/volume"

  volume_name  = "${var.prefix}${var.volume_name}"
  volume_count = var.volume_count
  volume_size  = var.volume_size
}