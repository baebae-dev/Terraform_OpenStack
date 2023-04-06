module "sg_bastion" {
  source = "../../primitives/security_group"
  sec_group_name = "${var.prefix}${var.security_group_name}-bastion"
  description = "my public security group"

  rules  = [
    {
      "direction"       = "ingress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "remote_ip_prefix" = "0.0.0.0/0"
    },
    {
      "direction"       = "ingress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "port_range_min"  = 22,
      "port_range_max"  = 22,
      "remote_ip_prefix" = "0.0.0.0/0"
    },
    {
      "direction"       = "egress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "port_range_min"  = 22,
      "port_range_max"  = 22,
      "remote_ip_prefix" = "0.0.0.0/0"
    },
    {
      "direction"       = "egress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "port_range_min"  = 80,
      "port_range_max"  = 80,
      "remote_ip_prefix" = "0.0.0.0/0"
    },
    {
      "direction"       = "egress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "port_range_min"  = 443,
      "port_range_max"  = 443,
      "remote_ip_prefix" = "0.0.0.0/0"
    }
  ]
}

module "sg_priv" {
  source = "../../primitives/security_group"
  sec_group_name = "${var.prefix}${var.security_group_name}-priv"
  description = "my private security group"

  rules  = [
    {
      "direction"       = "ingress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "port_range_min"  = 22,
      "port_range_max"  = 22,
      "remote_ip_prefix" = "192.168.1.0/16"
    },
    {
      "direction"       = "egress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "port_range_min"  = 80,
      "port_range_max"  = 80,
      "remote_ip_prefix" = "192.168.1.0/16"
    },
    {
      "direction"       = "egress",
      "ethertype"       = "IPv4",
      "protocol"        = "tcp",
      "port_range_min"  = 443,
      "port_range_max"  = 443,
      "remote_ip_prefix" = "192.168.1.0/16"
    }
  ]
}

module "sg_pub" {
  source = "../../primitives/security_group"
  sec_group_name = "${var.prefix}${var.security_group_name}-pub"
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