provider "openstack" {
  user_name   = var.openapi_user_name
  tenant_id   = var.tenant_id
  user_domain_name = var.user_domain_name
  password    = var.openapi_user_password
  auth_url    = var.auth_url
  region      = "RegionOne"
  endpoint_overrides = {
    "network"  = "${var.endpoint_override_url}/network/"
    "volumev3" = "${var.endpoint_override_url}/volume/${var.tenant_id}/"
    "compute"  = "${var.endpoint_override_url}/compute/"
    "image"    = "${var.endpoint_override_url}/images/"
  }
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