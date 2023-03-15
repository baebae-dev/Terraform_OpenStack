data "openstack_images_image_v2" "image_001" {
  name   = "Ubuntu18.04.6-Cloud"
  region = var.region_name
}

data "openstack_images_image_v2" "image_002" {
  name   = "CentOS7.9-Cloud"
  region = var.region_name
}