data "openstack_images_image_v2" "ubuntu_image" {
  name        = var.image_name_ubuntu
}

data "openstack_images_image_v2" "centos_image" {
  name        = var.image_name_centos
}