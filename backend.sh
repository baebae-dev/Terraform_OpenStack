#!/bin/bash
source ./env.sh

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

export X_Auth_Token=`awk -F ': ' '/^X-Subject-Token/ {print $2}' result_Object_storage_header.txt`
X_Auth_Token=$(echo $X_Auth_Token | sed 's/.$//')
echo "============== X_Auth_Token =============="
echo $X_Auth_Token
echo "=========================================="
rm result_Object_storage_header.txt

export remote_state_filenm="terraform-tt.tfstate"
export object_storage_url="https://gov-cbt-objectstorage.kakaoicloud.in/v1/8323ba34b836415a98bc45c8b715dcfc/remote-state/${remote_state_filenm}"

# backend 파일 전송
echo "curl -i ${object_storage_url} -X  PUT -d "@terraform.tfstatevv" -H \"X-Auth-Token: ${X_Auth_Token}\""
curl -i ${object_storage_url} -X PUT -d "@terraform.tfstate" -H "X-Auth-Token: ${X_Auth_Token}" --http1.1