# Terraform으로 공공 클라우드 설치하기
## 리소스 생성 방법
### 준비   
1. openAPI 인증값 설정
> env.sh 파일 내 프로젝트 id, user id, password 입력 후 실행   
`` sh auth.sh ``   
> secret.tfvars 파일 자동 생성   
2. prefix 수정
> 생성되는 컴포넌트 명 중복 충돌을 막고자
> [terraform.tfvars](https://cbt-gitlab.gov.kakaoicloud.com/bell.coco/govcloud-terraform/-/blob/master/terraform.tfvars#L35)의 prefix 변수값 본인 이름으로 수정 후 사용    
3. remote state 상태파일 저장을 위한 설정
> backend.sh 파일 내 X_Auth_Token, remote_state_filenm, object_storage_url 입력 
> - X_Auth_Token : 인증 토큰 (backend.sh 파일 내 curl 파일 실행으로 구할 수 있음)
> - remote_state_filenm : 원격 container에 저장할 파일명
> - object_storage_url : 저장할 원격 container 접근 url
### terraform 실행
- 설정 파일에 모듈 등록   
  ``terraform init ``
- 리소스 생성 확인    
  ``terraform plan -var-file="secret.tfvars"``
- 리소스 생성    
  ``terraform apply -var-file="secret.tfvars"``
- 상태파일 저장   
  ``sh backend.sh``
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

### remote state 사용
>**[remote_state branch의 "remote_state_test"](https://cbt-gitlab.gov.kakaoicloud.com/bell.coco/govcloud-terraform/-/tree/remote_state/remote_state_test) 폴더 참고**   
> [wiki 협업 상태파일 관리 [실전적용] 가이드](https://wiki.daumkakao.com/pages/viewpage.action?pageId=1110506073) 참고
- state file 업로드
> terraform 생성 작업 완료 후    
> remote container 없을 경우 먼저 생성 (있는 경우 스킵)
> backend.sh에 변수 "object_storage_url"에 생성한 remote container 접근 url 작성   
> ``sh backend.sh`` 로 terraform.state 파일 remote container에 업로드   
- state file 사용   
> [remote_state_test/backend_use.tf](https://cbt-gitlab.gov.kakaoicloud.com/bell.coco/govcloud-terraform/-/blob/remote_state/remote_state_test/backend_use.tf) 참고   
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