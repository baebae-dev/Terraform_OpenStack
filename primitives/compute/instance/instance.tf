################################################################################
# Instance
################################################################################

resource "openstack_compute_instance_v2" "instance" {
  name            = var.instance_name
  region          = var.region_name
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id
  key_pair        = var.keypair_name

  user_data = <<EOF
   #cloud-config
   password: ${var.password}
   chpasswd: { expire: False }
   ssh_pwauth: True
  EOF


#  block_device {
#    uuid                  = data.openstack_images_image_v2.image.id
#    source_type           = "image"
#    volume_size           = var.block_device_volume_size
#    boot_index            = 0
#    destination_type      = "volume"
#    delete_on_termination = var.block_device_delete_on_termination
#  }

  network {
    port = openstack_networking_port_v2.port.id
  }
}

################################################################################
# Port
################################################################################

resource "openstack_networking_port_v2" "port" {
  name               = var.port_name
  network_id         = var.network_id
  admin_state_up     = var.admin_state_up
  security_group_ids = var.sec_group_ids

  fixed_ip {
    subnet_id = var.subnet_id
    ip_address = var.fixed_ip_address == null ? null : var.fixed_ip_address
  }

  port_security_enabled = var.port_security_enabled
}

################################################################################
# Floating Ip
################################################################################

resource "openstack_networking_floatingip_v2" "floating_ip" {
  count = var.is_public ? 1 : 0
  pool = var.public_ip_network_name
}

resource "openstack_compute_floatingip_associate_v2" "floating_ip_associate" {
  count = var.is_public ? 1 : 0
  floating_ip = openstack_networking_floatingip_v2.floating_ip[count.index].address
  instance_id = openstack_compute_instance_v2.instance.id
}