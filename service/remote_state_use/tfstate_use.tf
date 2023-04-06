# 원격 저장소의 remote 파일 가져옴
data "terraform_remote_state" "remote" {
  backend = "http"
  config = {
    address = var.backend_address
  }
}

# 동작 : remote state에 기록된 생성된 priv vm에 volume attach
resource "openstack_compute_volume_attach_v2" "volume_attach" {
  count       = var.volume_count * var.instance_pub_count
  volume_id   = element(module.volume.volume_id, var.volume_count)
  instance_id = element(data.terraform_remote_state.remote.outputs.priv_instance_id[0], var.instance_pub_count)
  device      = var.volume_path

  depends_on = [
    module.volume
  ]
}
