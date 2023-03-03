module "sg_pub" {
  source = "./modules/network/security-group"
  sec_group_name = "jason-tf-sg"
  description = "my security group"

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

module "sg_priv" {
  source = "./modules/network/security-group"
  sec_group_name = "jason-tf-sg"
  description = "my security group"

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
