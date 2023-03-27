module "test" {
  source = "./services/test"

  # openAPI
  auth_url                     = var.auth_url
  object_storage_user_name     = var.object_storage_user_name
  object_storage_user_password = var.object_storage_user_password
  openapi_user_name            = var.openapi_user_name
  openapi_user_password        = var.object_storage_user_password
  tenant_id                    = var.tenant_id
  user_domain_name             = var.user_domain_name
  endpoint_override_url        = var.endpoint_override_url

  # prefix
  prefix = var.prefix

  # security-group
  sec_group_name_priv = var.sec_group_name_priv
  # keypair
  keypair_name        = var.keypair_name
  # instance
  instance_count      = var.instance_count
  instance_name       = var.instance_name
  # volume
  volume_name         = var.volume_name
  volume_count        = var.volume_count
  volume_size         = var.volume_size
  volume_path         = var.volume_path
}