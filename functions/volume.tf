# volume
module "volume" {
  source        = "../primitives/volume"

  volume_name = "${var.prefix}${var.volume_name}"
  count         = var.volume_count
  db_data_volume_size = var.volume_size
}