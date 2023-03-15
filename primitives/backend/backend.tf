resource "openstack_objectstorage_container_v1" "terraform_state" {
  region = "RegionOne"
  name   = "${var.object_storage_name}"

  lifecycle {
    prevent_destroy = true
  }

  provider = openstack.object-storage
}

resource "local_file" "make_tfsate_to_json" {
  content_base64 = filebase64("terraform.tfstate")
  filename       = "terraform.json"
}

resource "openstack_objectstorage_object_v1" "tfstate" {
  region         = "RegionOne"
  container_name = "${var.object_storage_name}"
  name           = "${var.env}/terraform.tfstate"

  source       = "./terraform.json"
  depends_on = [
    local_file.make_tfsate_to_json
  ]
  lifecycle {
    prevent_destroy = true
  }

  provider = openstack.object-storage
}