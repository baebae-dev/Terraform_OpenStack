# volume
module "volume" {
  source        = "../primitives/volume"

  volume_name = "${var.prefix}${var.volume_name}"
  count         = var.db_count
  db_data_volume_size = var.db_data_volume_size
}