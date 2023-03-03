resource "openstack_networking_secgroup_v2" "sec_group" {
  name        = var.sec_group_name
  description = var.description
}

resource "openstack_networking_secgroup_rule_v2" "rule_ssh_ingress" {
  count             = length(var.rules) > 0 ? length(var.rules) : 0
  security_group_id = openstack_networking_secgroup_v2.sec_group.id

  direction         = try(var.rules[count.index].direction, "")
  ethertype         = try(var.rules[count.index].ethertype, "")
  protocol          = try(var.rules[count.index].protocol, "")
  port_range_min    = try(var.rules[count.index].port_range_min, "")
  port_range_max    = try(var.rules[count.index].port_range_max, "")
  remote_ip_prefix   = try(var.rules[count.index].remote_ip_prefix, "")
}