resource "openstack_objectstorage_container_v1" "terraform_state" {
  region = "RegionOne"
  name   = "${var.remote_state_name}"

  lifecycle {
    prevent_destroy = true
  }

  provider = openstack.object-storage
}