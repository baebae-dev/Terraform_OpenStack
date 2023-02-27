provider "openstack" {
  user_name    = "kepcloudadmin"
  tenant_id    = "0b8bd4a2747c47a8bb9df6e63f71ca39"
  password     = "password"
  auth_url     = "https://cbt-os-identity.gov.kakaoicloud.com/v3"
  region       = "RegionOne"
}

#provider "openstack" {
#  tenant_id    = "0b8bd4a2747c47a8bb9df6e63f71ca39"
#  user_name    = "kepcloudadmin"
#  password     = "password"
#  auth_url     = "https://cbt-openapi.gov.kakaoicloud.com/api/identity/v3/"
#  auth_api_key = "apikey"
#  region       = "RegionOne"
#}