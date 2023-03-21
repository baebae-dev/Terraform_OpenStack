
# module "backend_test" {
#   source = "./test"
#
##   backend_address   = var.backend_address
#   remote_state_name = var.remote_state_name
#   auth_url = var.auth_url
#   object_storage_user_name = var.object_storage_user_name
#   object_storage_user_password = var.object_storage_user_password
#   openapi_user_name = var.openapi_user_name
#   openapi_user_password = var.object_storage_user_password
#   tenant_id = var.tenant_id
#   user_domain_name = var.user_domain_name
#   endpoint_override_url = var.endpoint_override_url
# }

module "all" {
  source = "./functions"


  auth_url = var.auth_url
  object_storage_user_name = var.object_storage_user_name
  object_storage_user_password = var.object_storage_user_password
  openapi_user_name = var.openapi_user_name
  openapi_user_password = var.object_storage_user_password
  tenant_id = var.tenant_id
  user_domain_name = var.user_domain_name
  endpoint_override_url = var.endpoint_override_url
}