output "objectStorage_name" {
  value = openstack_objectstorage_container_v1.objectStorage.name
  description = "objectStorage name"
}

output "objectStorage_id" {
  value = openstack_objectstorage_container_v1.objectStorage.id
}