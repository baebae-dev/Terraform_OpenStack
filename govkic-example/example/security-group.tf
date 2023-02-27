resource "openstack_networking_secgroup_v2" "jason-tf-secgroup" {
  name        = "jason-tf-secgroup"
  description = "my-secgroup"
}

resource "openstack_networking_secgroup_rule_v2" "jason-tf-rule-ssh-ingress" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix   = var.pub_subnet_cidr
  security_group_id = openstack_networking_secgroup_v2.jason-tf-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "jason-tf-rule-https-ingress" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix   = var.priv_subnet_cidr
  security_group_id = openstack_networking_secgroup_v2.jason-tf-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "jason-tf-rule-http-ingress" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix   = var.priv_subnet_cidr
  security_group_id = openstack_networking_secgroup_v2.jason-tf-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "jason-tf-rule-http-egress" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix   = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.jason-tf-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "jason-tf-rule-https-egress" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix   = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.jason-tf-secgroup.id
}