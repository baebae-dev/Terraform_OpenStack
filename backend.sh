export X_Auth_Token="gAAAAABkEogYrgb4rw_iaW3rExsFRvGyDo_JRGmuxlmLrRE5FJb5qDnbZVm6Sy83avXltH_-3rv9-8nqjKm6pstHtVrKg8SBaoy4riS0RbXLwTnAJTRjb7ufw69uxN6kvh5oVlhDbM-j6qCxIGqO9LC4nlAJR1bzKxt_CzcqAuY6X0WDDYaBdA4"
export object_storage_url="https://gov-cbt-objectstorage.kakaoicloud.in/v1/8323ba34b836415a98bc45c8b715dcfc/remote-state/terraform.tfstate"

# backend 파일 전송
echo "curl -i ${object_storage_url} -X PUT -d "@terraform.tfstate" -H 'X-Auth-Token: ${X_Auth_Token}'"
curl -i ${object_storage_url} -X PUT -d "@terraform.tfstate" -H "X-Auth-Token: ${X_Auth_Token}"


