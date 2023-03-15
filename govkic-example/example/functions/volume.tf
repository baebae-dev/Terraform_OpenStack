# volume
module "volume" {
  source        = "../../modules/volume"

  count         = var.db_count
  db_data_volume_size = var.db_data_volume_size
}