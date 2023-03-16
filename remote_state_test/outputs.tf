# 사용하고자 하는 기존 리소스 정보 output 정의 필요

output "objectStorage" {
  value = module.objectStorage.objectStorage_name
}
