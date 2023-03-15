# Terraform으로 공공 클라우드 설치하기
## 리소스 생성 방법
### 준비   
1. openAPI 인증값 설정
> auth.sh 파일 내 프로젝트 id, user id, password 입력 후 실행   
`` sh auth.sh ``   
> secret.tfvars 파일 자동 생성   
2. prefix 수정
> 생성되는 컴포넌트 명 중복 충돌을 막고자
> [terraform.tfvars](https://cbt-gitlab.gov.kakaoicloud.com/bell.coco/govcloud-terraform/-/blob/master/terraform.tfvars)의 prefix 변수값 본인 이름으로 수정 후 사용    
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
📦govcloud-terraform
 ┣ 📂functions
 ┃ ┣ 📜backend.tf
 ┃ ┣ 📜bastion-instance.tf
 ┃ ┣ 📜instances.tf
 ┃ ┣ 📜keypair.tf
 ┃ ┣ 📜nat-instance.tf
 ┃ ┣ 📜objectStorage.tf
 ┃ ┣ 📜outputs.tf
 ┃ ┣ 📜security-group.tf
 ┃ ┣ 📜variables.tf
 ┃ ┣ 📜volume.tf
 ┃ ┗ 📜vpc.tf
 ┣ 📂primitives
 ┃ ┣ 📂backend
 ┃ ┃ ┣ 📜backend.tf
 ┃ ┃ ┣ 📜variables.tf
 ┃ ┃ ┗ 📜version.tf
 ┃ ┣ 📂compute
 ┃ ┃ ┣ 📂flavor
 ┃ ┃ ┃ ┣ 📜flavor.tf
 ┃ ┃ ┃ ┗ 📜output.tf
 ┃ ┃ ┣ 📂image
 ┃ ┃ ┃ ┣ 📜image.tf
 ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┗ 📜variable.tf
 ┃ ┃ ┣ 📂instance
 ┃ ┃ ┃ ┣ 📜data.tf
 ┃ ┃ ┃ ┣ 📜instance.tf
 ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┣ 📜variable.tf
 ┃ ┃ ┃ ┗ 📜versions.tf
 ┃ ┃ ┗ 📂keypair
 ┃ ┃ ┃ ┣ 📜keypair.tf
 ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┣ 📜variable.tf
 ┃ ┃ ┃ ┗ 📜versions.tf
 ┃ ┣ 📂network
 ┃ ┃ ┣ 📂router
 ┃ ┃ ┃ ┣ 📂ext
 ┃ ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┃ ┣ 📜router.tf
 ┃ ┃ ┃ ┃ ┣ 📜variable.tf
 ┃ ┃ ┃ ┃ ┗ 📜versions.tf
 ┃ ┃ ┃ ┣ 📂in
 ┃ ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┃ ┣ 📜router.tf
 ┃ ┃ ┃ ┃ ┣ 📜variable.tf
 ┃ ┃ ┃ ┃ ┗ 📜versions.tf
 ┃ ┃ ┃ ┗ 📂route
 ┃ ┃ ┃ ┃ ┣ 📜route.tf
 ┃ ┃ ┃ ┃ ┣ 📜variable.tf
 ┃ ┃ ┃ ┃ ┗ 📜versions.tf
 ┃ ┃ ┣ 📂security-group
 ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┣ 📜security-group.tf
 ┃ ┃ ┃ ┣ 📜variable.tf
 ┃ ┃ ┃ ┗ 📜versions.tf
 ┃ ┃ ┗ 📂vpc
 ┃ ┃ ┃ ┣ 📜network.tf
 ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┣ 📜variable.tf
 ┃ ┃ ┃ ┗ 📜versions.tf
 ┃ ┣ 📂objectStorage
 ┃ ┃ ┣ 📜objectStorage.tf
 ┃ ┃ ┣ 📜variables.tf
 ┃ ┃ ┗ 📜version.tf
 ┃ ┗ 📂volume
 ┃ ┃ ┣ 📜variables.tf
 ┃ ┃ ┣ 📜version.tf
 ┃ ┃ ┗ 📜volume.tf
 ┣ 📜.gitignore
 ┣ 📜auth.sh
 ┣ 📜main.tf
 ┣ 📜outputs.tf
 ┣ 📜provider.tf
 ┣ 📜readme.md
 ┣ 📜secret.tfvars
 ┣ 📜terraform.tfstate
 ┣ 📜variables.tf
 ┣ 📜terraform.tfvars
 ┗ 📜versions.tf 
```