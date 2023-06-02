# Terraform으로 공공 클라우드 설치하기
## 리소스 생성 방법

### terraform 실행
- 설정 파일에 모듈 등록   
  ``terraform init ``
- 리소스 생성 확인    
  ``terraform plan -var-file="secret.tfvars"``
- 리소스 생성    
  ``terraform apply -var-file="secret.tfvars"``

> 준비 3. 과정 진행 후 실행   
- 리소스 삭제    
  ``terraform destroy -var-file="secret.tfvars"``
### terragrunt 를 통한 리소스 생성
- terragrunt 설치 (이미 설치된 경우 skip)  
``brew install terragrunt``
- 설정 파일에 모듈 등록     
  ``terraform init ``
- 리소스 생성 확인   
``terragrunt apply``
> apply 실행 시, 컴포넌트 생성 & 상태파일 원격 container 저장 동시에 진행
- 리소스 생성 삭제   
  ``terragrunt destroy``

## Project Structure
```
📦govcloud-terraform
 ┣ 📂service
 ┃ ┣ 📂catalog_001          
 ┃ ┗ 📂remote_state_use     # 원격 상태파일 사용 예시
 ┣ 📂functions
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
 ┣ 📜env.sh           # openAPI 인증 관련 계정값 
 ┣ 📜auth.sh          # openAPI 사용 인증
 ┣ 📜backend.sh       # state file -> remote container 업로드
 ┣ 📜main.tf
 ┣ 📜outputs.tf
 ┣ 📜provider.tf
 ┣ 📜readme.md
 ┣ 📜secret.tfvars
 ┣ 📜terraform.tfstate
 ┣ 📜variables.tf
 ┣ 📜terraform.tfvars
 ┣ 📜terragrunt.hcl   # terragrunt 사용을 위한 설정 파일 
 ┗ 📜versions.tf 
```