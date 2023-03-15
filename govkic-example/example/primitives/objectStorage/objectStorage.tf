resource "openstack_objectstorage_container_v1" "objectStorage" {
  region = "RegionOne"
  name   = "${var.object_storage_name}"

  provider = openstack.object-storage
}
