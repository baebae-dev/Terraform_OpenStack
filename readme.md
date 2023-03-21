# Terraform으로 공공 클라우드 설치하기
## 리소스 생성 방법
### 준비   
1. openAPI 인증값 설정
> auth.sh 파일 내 프로젝트 id, user id, password 입력 후 실행   
`` sh auth.sh ``   
> secret.tfvars 파일 자동 생성   
2. prefix 수정
> 생성되는 컴포넌트 명 중복 충돌을 막고자
> [terraform.tfvars](https://cbt-gitlab.gov.kakaoicloud.com/bell.coco/govcloud-terraform/-/blob/master/terraform.tfvars#L35)의 prefix 변수값 본인 이름으로 수정 후 사용    
### terraform 실행
- 설정 파일에 모듈 등록   
  ``terraform init ``
- 리소스 생성 확인    
  ``terraform plan -var-file="secret.tfvars"``
- 리소스 생성    
  ``terraform apply -var-file="secret.tfvars"``
- 리소스 삭제    
  ``terraform destroy -var-file="secret.tfvars"``
### remote state 사용
- state file 업로드
> terraform 생성 작업 완료 후    
> remote container 없을 경우 먼저 생성 (있는 경우 스킵)
> backend.sh에 변수 "object_storage_url"에 생성한 remote container 접근 url 작성   
> ``sh backend.sh`` 로 terraform.state 파일 remote container에 업로드   
- state file 사용   
> [remote_state_test/backend_use.tf](https://cbt-gitlab.gov.kakaoicloud.com/bell.coco/govcloud-terraform/-/blob/master/remote_state_test/backend_use.tf) 참고   
> 기존 리소스 중 사용할 리소스는 반드시 output 파일에 명시하여야 사용가능    
> output에 명시된 리소스를 사용하여 원하는 작업 진행   
> ``data "terraform_remote_state"``로 remote state file 가져와서 작업함.

## Project Structure
```
📦govcloud-terraform
 ┣ 📂service
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
 ┣ 📂remote_state_test      # remote_state 작업
 ┃ ┣ 📜backend_use.tf       # remtoe state 파일 불러와 사용 예시 
 ┃ ┣ 📜objectStorage.tf
 ┃ ┣ 📜outputs.tf
 ┃ ┣ 📜terraform.tf
 ┃ ┗ 📜variables.tf
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
 ┗ 📜versions.tf 
```