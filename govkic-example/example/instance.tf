data "openstack_compute_flavor_v2" "flavor" {
  name        = var.flavor_name
}

resource "openstack_compute_keypair_v2" "jason-tf-keypair" {
  name        = var.keypair_name
}

resource "openstack_compute_instance_v2" "jason-tf-pub-instance" {
  name            = "jason-tf-pub-instance"
  image_id        = data.openstack_images_image_v2.ubuntu_image.id
  flavor_id        = data.openstack_compute_flavor_v2.flavor.id
  security_groups = [var.secgroup_name]
  key_pair        = openstack_compute_keypair_v2.jason-tf-keypair.name

  network {
    port = openstack_networking_port_v2.jason-tf-port.id
  }

  user_data = <<EOF
#cloud-config
password: example1234!
chpasswd: { expire: True }
ssh_pwauth: True
EOF
}

resource "openstack_compute_instance_v2" "jason-tf-priv-instance" {
  name            = "jason-tf-priv-instance"
  image_id        = data.openstack_images_image_v2.ubuntu_image.id
  flavor_id        = data.openstack_compute_flavor_v2.flavor.id
  key_pair        = openstack_compute_keypair_v2.jason-tf-keypair.name

  network {
    uuid = openstack_networking_network_v2.jason-tf-network.id
  }
}