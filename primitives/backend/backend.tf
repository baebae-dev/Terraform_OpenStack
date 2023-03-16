data "terraform_remote_state" "remote" {
  backend = "http"
  config = {
    address = "https://gov-cbt-objectstorage.kakaoicloud.in/v1/8323ba34b836415a98bc45c8b715dcfc/tf-test-container"
  }
}

resource "openstack_objectstorage_object_v1" "tfstate_test" {
  region         = "RegionOne"
  container_name = data.terraform_remote_state.remote.outputs.id
  name           = "env.sh"

  source       = "./env.sh"

  provider = openstack.object-storage
}