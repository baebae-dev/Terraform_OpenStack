#!/bin/bash
export openAPI="True"
export openapi_userid="1c25ed49846f4d61bba37b8dd16bf85a"
export openapi_user_password="{zo51TOZIcm4Q/BKJQPTsoAJYe6Lkejjw5vMHMfe0O5Y=}746a1439c42a5f9b9d922461c145b0731a14cf5ed14909dfc19ff7ff32051545"

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
echo "object_storage_user_name $object_storage_user_name"
echo "user_domain_name $user_domain_name"
echo "=========================================="
fi

echo "\
tenant_id = "\""${tenant_id}"\""\n\
auth_url = "\"""https://gov-cbt-keystone.kakaoicloud.in/v3""\""\n\
user_domain_name = ${user_domain_name}\n\
openapi_user_name = ${openapi_user_name}\n\
openapi_user_password = "\""${openapi_user_password}"\""\n\
object_storage_user_name = ${object_storage_user_name}\n\
object_storage_user_password = "\""${object_storage_user_password}"\""" > ./secret.tfvars

echo "============== secret.tfvars 생성완료 =============="
echo "=========================================="
