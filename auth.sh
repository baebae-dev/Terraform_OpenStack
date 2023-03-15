#!/bin/bash
export openAPI="True"
export openapi_userid="e454f075d6fc4b1b8e0f2287df6061df"
export openapi_user_password="{p2pI0rt1u1toZSJcOCw9yUVQMKNQerqw9hVX3P8zURk=}0a07b97622460e7694168ab7ce5b89fa933d922f287b549f85ecff87b7cc6927"

export tenant_id="8323ba34b836415a98bc45c8b715dcfc"

export Object_storage="True"
export object_storage_userid="86c113235b22469cbdf4e48ec2709348"
export object_storage_user_password="{bKTujW0ULDg1AwJTDgS4Ukjm0mbw8vRrNvf/PZ1iJ/s=}8366d9918231eda38cb9699b8f9d942153b6209489a1bec3ac13a5042d0ada2c"


if [[ ${openAPI} == "True" ]]; then
  echo "============== openAPI request Token =============="
  curl --location --request POST 'https://cbt-os-identity.gov.kakaoicloud.com/v3/auth/tokens' \
                --header 'Content-Type: application/json' \
                --data-raw '{
                    "auth": {
                        "identity": {
                            "methods": [
                                "password"
                            ],
                            "password": {
                                "user": {
                                    "id": "'"${openapi_userid}"'",
                                    "password": "'"${openapi_user_password}"'"
                                }
                            }
                        },
                        "scope": {
                            "project": {
                                "id": "'"${tenant_id}"'"
                            }
                        }
                    }
                }' | jq > result_openAPI.json

echo "=========================================="
export openapi_user_name=$(cat result_openAPI.json | jq '.token.user.name')
export user_domain_name=$(cat result_openAPI.json | jq '.token.user.domain.name')
echo "openapi_user_name $openapi_user_name"
echo "user_domain_name $user_domain_name"
rm result_openAPI.json
echo "=========================================="
fi

if [[ ${Object_storage} == "True" ]]; then
  echo "Object Storage openAPI request Token"
  curl --location 'https://gov-cbt-keystone.kakaoicloud.in/v3/auth/tokens' \
  --header 'Content-Type: application/json' \
  --data '{
      "auth": {
          "identity": {
              "methods": [
                  "password"
              ],
              "password": {
                  "user": {
                        "id": "'"${object_storage_userid}"'",
                        "password": "'"${object_storage_user_password}"'"
                  }
              }
          },
          "scope": {
              "project": {
                    "id": "'"${tenant_id}"'"
              }
          }
      }
  }' | jq > result_Object_storage.json

echo "=========================================="
export object_storage_user_name=$(cat result_Object_storage.json | jq '.token.user.name')
export user_domain_name=$(cat result_Object_storage.json | jq '.token.user.domain.name')
#export X_Auth_Token=$(cat result_Object_storage_header.json | jq 'X-Subject-Token')
echo "object_storage_user_name $object_storage_user_name"
echo "user_domain_name $user_domain_name"
#echo "X_Auth_Token $X_Auth_Token"
rm result_Object_storage.json
echo "=========================================="
fi

echo "\
tenant_id = "\""${tenant_id}"\""\n\
auth_url = "\"""https://gov-cbt-keystone.kakaoicloud.in/v3""\""\n\
endpoint_override_url = "\"""https://cbt-openapi.gov.kakaoicloud.com/api""\""\n\
user_domain_name = ${user_domain_name}\n\
openapi_user_name = ${openapi_user_name}\n\
openapi_user_password = "\""${openapi_user_password}"\""\n\
object_storage_user_name = ${object_storage_user_name}\n\
object_storage_user_password = "\""${object_storage_user_password}"\""" > ./secret.tfvars

echo "============== secret.tfvars 생성완료 =============="
echo "=========================================="