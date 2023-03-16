##!/bin/bash
source ./env.sh

# X_Auth_Token
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

export X_Auth_Token=`awk '/X-Subject-Token/' result_Object_storage_header.txt`
X_Auth_Token=$(echo $X_Auth_Token | cut -d ':' -f 2)
echo "X_Auth_Token $X_Auth_Token"
rm result_Object_storage_header.txt

# backend 파일 전송
#echo "curl -i ${object_storage_url} -X PUT -d "@terraform.tfstate" -H 'X-Auth-Token: ${X_Auth_Token}'"
#curl -i ${object_storage_url} -X PUT -d "@terraform.tfstate" -H "X-Auth-Token: ${X_Auth_Token}"

#curl -i https://gov-cbt-objectstorage.kakaoicloud.in/v1/8323ba34b836415a98bc45c8b715dcfc/tf-test-container/terraform.tfstate \
#-X PUT -d "@terraform.tfstate" \
#-H 'X-Auth-Token:gAAAAABkEogYrgb4rw_iaW3rExsFRvGyDo_JRGmuxlmLrRE5FJb5qDnbZVm6Sy83avXltH_-3rv9-8nqjKm6pstHtVrKg8SBaoy4riS0RbXLwTnAJTRjb7ufw69uxN6kvh5oVlhDbM-j6qCxIGqO9LC4nlAJR1bzKxt_CzcqAuY6X0WDDYaBdA4'