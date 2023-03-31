# objectStorage
module "objectStorage" {
  source        = "../primitives/object_storage"

  object_storage_name = "${var.prefix}${var.object_storage_name}"
  tenant_id = var.tenant_id
  user_domain_name = var.user_domain_name
  openapi_user_password = var.openapi_user_password
  auth_url = var.auth_url
  object_storage_user_name = var.object_storage_user_name
  object_storage_user_password = var.object_storage_user_password
  openapi_user_name = var.openapi_user_name
}