#!/bin/bash
source ./env.sh

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
echo "object_storage_user_name $object_storage_user_name"
if [[ -z ${user_domain_name}  ]]; then
  export user_domain_name=$(cat result_Object_storage.json | jq '.token.user.domain.name')
  echo "user_domain_name $user_domain_name"
fi
echo "=========================================="
fi

echo "\
tenant_id = "\""${tenant_id}"\""\n\
auth_url = "\"""https://cbt-openapi.gov.kakaoicloud.com/api/identity/v3/""\""\n\
endpoint_override_url = "\"""https://cbt-openapi.gov.kakaoicloud.com/api""\""\n\
user_domain_name = ${user_domain_name}\n\
openapi_user_name = ${openapi_user_name}\n\
openapi_user_password = "\""${openapi_user_password}"\""\n\
object_storage_user_name = ${object_storage_user_name}\n\
object_storage_user_password = "\""${object_storage_user_password}"\""" > ./secret.tfvars

echo "============== secret.tfvars 생성완료 =============="
echo "=========================================="