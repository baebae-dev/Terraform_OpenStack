module "main" {
  source = "service/catalog_001"

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
  security_group_name = var.security_group_name
  # keypair
  keypair_name        = var.keypair_name
  # instance
  instance_app_count      = var.instance_app_count
  instance_app_name       = var.instance_app_name
  instance_pub_count      = var.instance_pub_count
  instance_pub_name       = var.instance_pub_name
  instance_bastion_count  = var.instance_bastion_count
  instance_bastion_name   = var.instance_bastion_name
  instance_nat_name       = var.instance_nat_name
  instance_nat_count      = var.instance_nat_count
  instance_db_count       = var.instance_db_count
  instance_db_name        = var.instance_db_name
  image_name              = var.image_name
  flavor_name             = var.flavor_name
  password                = var.password
  # volume
  volume_name         = var.volume_name
  volume_count        = var.volume_count
  volume_size         = var.volume_size
  volume_path         = var.volume_path
  # vpc
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  network_name         = var.network_name
  subnet_name          = var.subnet_name
  router_name          = var.router_name

}