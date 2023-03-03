terraform {
  required_version = ">= 1.0.0"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.49.0"
    }
  }
}

#terraform {
#  required_version = ">= 1.0.0"
#
#  required_providers {
#    openstack = {
#      source  = "govcloud.io/terraform-provider-openstack/openstack"
#      version = "~> 0.0.1"
#    }
#  }
#}