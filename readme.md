# Terraform으로 공공 클라우드 설치하기
## 리소스 생성 방법
### 준비
- openAPI 인증값 설정
> auth.sh 파일 내 프로젝트 id, user id, password 입력 후 실행   
`` sh auth.sh ``   
> secret.tfvars 파일 자동 생성
### terraform 실행
- 설정 파일에 모듈 등록   
  ``terraform init ``
- 리소스 생성 확인    
  ``terraform plan -var-file="secret.tfvars"``
- 리소스 생성    
  ``terraform apply -var-file="secret.tfvars"``
- 리소스 삭제    
  ``terraform destroy -var-file="secret.tfvars"``

## Project Structure
```
govcloud-terraform
├──  govkic-example
│   └── example                                     # gov kic 컴포넌트 생성 소스 
│       ├── image.tf                                     
│       ├── instance.tf 
│       ├── network.tf  
│       ├── provider.tf
│       ├── required.tf
│       ├── security-group.tf
│       └── variables.tf
             
```