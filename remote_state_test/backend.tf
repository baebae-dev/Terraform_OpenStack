# 원격 저장소의 remote 파일 가져옴
data "terraform_remote_state" "remote" {
  backend = "http"
  config = {
    address = var.backend_address
  }
}

# test 용
# 동작 : remote state에 기록된 생성된 object storage에 object 업로드
resource "openstack_objectstorage_object_v1" "tfstate_test" {
  region         = "RegionOne"
  container_name = data.terraform_remote_state.remote.outputs.objectStorage
  name           = "env.sh"
  source       = "./env.sh"

  provider = openstack.object-storage
}