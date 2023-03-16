terraform {
  required_version = ">= 1.0.0"

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.49.0"
    }
  }
}

provider "openstack" {
  user_name   = var.openapi_user_name
  tenant_id   = var.tenant_id
  user_domain_name = var.user_domain_name
  password    = var.openapi_user_password
  auth_url    = var.auth_url
  region      = "RegionOne"
}

provider "openstack" {
  alias = "object-storage"
  user_name   = var.object_storage_user_name
  tenant_id   = var.tenant_id
  user_domain_name = var.user_domain_name
  password    = var.object_storage_user_password
  auth_url    = var.auth_url
  region      = "RegionOne"
}