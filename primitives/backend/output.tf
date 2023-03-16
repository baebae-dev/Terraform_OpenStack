output "objectStorage_name" {
  value = openstack_objectstorage_container_v1.terraform_state.name
  description = "terraform state name"
}