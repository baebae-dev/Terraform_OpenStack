module "sg_priv" {
  source = "../../primitives/network/security-group"
  sec_group_name = "${var.prefix}${var.sec_group_name_priv}"
  description = "my private security group"

  rules  = [
    {
      "direction"       = "ingress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "port_range_min"  = 22,
      "port_range_max"  = 22,
      "remote_ip_prefix" = "192.168.0.0/16"
    },
    {
      "direction"       = "egress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "port_range_min"  = 80,
      "port_range_max"  = 80,
      "remote_ip_prefix" = "192.168.0.0/16"
    },
    {
      "direction"       = "egress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "port_range_min"  = 443,
      "port_range_max"  = 443,
      "remote_ip_prefix" = "192.168.0.0/16"
    }
  ]
}

module "sg_pub" {
  source = "../../primitives/network/security-group"
  sec_group_name = "${var.prefix}${var.sec_group_name_pub}"
  description = "my public security group"

  rules  = [
    {
      "direction"       = "ingress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "port_range_min"  = 22,
      "port_range_max"  = 22,
      "remote_ip_prefix" = "0.0.0.0/0"
    },
    {
      "direction"       = "ingress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "port_range_min"  = 80,
      "port_range_max"  = 80,
      "remote_ip_prefix" = "0.0.0.0/0"
    },
    {
      "direction"       = "ingress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "port_range_min"  = 443,
      "port_range_max"  = 443,
      "remote_ip_prefix" = "0.0.0.0/0"
    }
  ]
}