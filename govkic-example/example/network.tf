resource "openstack_networking_network_v2" "jason-tf-network" {
  name           = "jason-tf-network"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "jason-tf-pub-subnet" {
  name       = "jason-tf-pub-subnet"
  network_id = openstack_networking_network_v2.jason-tf-network.id
  cidr       = var.pub_subnet_cidr
  ip_version = 4
}

resource "openstack_networking_subnet_v2" "jason-tf-priv-subnet" {
  name       = "jason-tf-priv-subnet"
  network_id = openstack_networking_network_v2.jason-tf-network.id
  cidr       = var.priv_subnet_cidr
  ip_version = 4
}

resource "openstack_networking_port_v2" "jason-tf-port" {
  name         = "jason-tf-port"
  network_id   = openstack_networking_subnet_v2.jason-tf-pub-subnet.network_id
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.jason-tf-pub-subnet.id
  }
  allowed_address_pairs {
    ip_address = "0.0.0.0/0"
  }
}