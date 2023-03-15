# volume
module "volume" {
  source        = "../primitives/volume"

  count         = var.db_count
  db_data_volume_size = var.db_data_volume_size
}