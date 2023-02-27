resource "openstack_compute_instance_v2" "instance" {
  count       = var.instance_count
  name        = var.instance_name
  flavor_name = var.instance_flavor

  block_device {
    uuid                  = data.openstack_images_image_v2.default_image.id
    source_type           = "image"
    volume_size           = 50
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    port = openstack_networking_port_v2.instance[count.index].id
  }
}