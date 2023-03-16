#!/bin/bash
export openAPI="True"
export openapi_userid="451bb51cd138412f85ff00ce898e7a9d"
export openapi_user_password="{/ybCAi/ngsSp7bhiakZ6UqfPHNVy0c6kEg5N7o3SCJQ=}54e3193476a030f828aa152c586ce808062426eb427980812264a70d8d19095f"

export tenant_id="8323ba34b836415a98bc45c8b715dcfc"

export Object_storage="True"
export object_storage_userid="ea23b046595d494e8b3e34c2dfa2b06c"
export object_storage_user_password="{3RlCtdTtwybGDRIjcVhiu97Xtu23OZGSVwDAp38kTfY=}7f9323e3df864982c1ab129ed97d4b599f5f059b6cb3031533fbd64559215ab2"


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
  curl -i --location 'https://gov-cbt-keystone.kakaoicloud.in/v3/auth/tokens' \
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
  }'  > result_Object_storage_header.txt

echo "=========================================="
export object_storage_user_name=$(cat result_Object_storage.json | jq '.token.user.name')
echo "object_storage_user_name $object_storage_user_name"
if [[ -z ${user_domain_name}  ]]; then
  export user_domain_name=$(cat result_Object_storage.json | jq '.token.user.domain.name')
  echo "user_domain_name $user_domain_name"
fi
export X_Auth_Token=awk '/X-Subject-Token/' result_Object_storage_header.txt
echo "X_Auth_Token $X_Auth_Token"
rm result_Object_storage.json
rm result_Object_storage_header.txt
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