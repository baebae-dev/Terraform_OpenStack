#!/bin/bash
source ./env.sh

export get_X_Auth_Token="False"
# get X_Auth_Token
if [[ ${get_X_Auth_Token} == "True" ]]; then
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
  X_Auth_Token=$(echo $X_Auth_Token | tr -d ' ')
  echo "============== X_Auth_Token =============="
  echo $X_Auth_Token
  echo "=========================================="
  rm result_Object_storage_header.txt
else
  echo ""
    export X_Auth_Token="gAAAAABkLimEfw6g5uU95yYbKp5aC-ftcZRAsch4w-XA3ZjsdeCVZuTTDdKjRrkPWdwBV5dUUOTsOxrecDJsaq6fFFJdRoDsy7zSyipUphDs8DQs6vj7y990jMubqlmpa8iN3KwnLV6PnxNkgcO1PsKoS9GCp3PHKjmeuvbgmD3Fkx27tRvxJC8"
fi

export remote_state_filenm="terraform.tfstate"
export object_storage_url="https://gov-cbt-objectstorage.kakaoicloud.in/v1/8323ba34b836415a98bc45c8b715dcfc/remote-state/${remote_state_filenm}"

# backend 파일 전송
echo "curl -i ${object_storage_url} -X  PUT -d "@terraform.tfstate" -H \"X-Auth-Token: ${X_Auth_Token}\""
curl -i ${object_storage_url} -X PUT -d "@terraform.tfstate" -H "X-Auth-Token: ${X_Auth_Token}" --http1.1