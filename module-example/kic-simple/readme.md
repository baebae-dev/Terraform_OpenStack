# Terraform으로 카카오 i 클라우드 VM 생성하기
## Step 1. Terraform 설치하기
Homebrew 패키지 매니저를 이용하거나, Terraform 공식 사이트에서 다운로드하여 설치합니다.  
``brew install terraform``  
설치가 정상적으로 되었는지 아래 명령어를 통해 확인합니다.   
``terraform -version``
> Terraform v1.3.3 ## ... -> 정상 설치 시 이와같은 버전 정보를 확인할 수 있습니다.

## Step 2. Terraform 설정 파일 작성하기
카카오 i 클라우드에 자원 생성을 요청하기 위해서는 자원을 생성할 리전 및 인증키 등의 추가적인 정보가 필요합니다. 아래 예제를 참고하여 기존 경로에 추가적인 정보를 생성하거나 해당 파일에 추가합니다.
````
mkdir -p ~/.config/openstack/ 
cat << EOF > ~/.config/openstack/clouds.yaml  
clouds:  
    hands-on:  
        region_name: 'kr-central-1'  
        interface: 'public'  
        auth_type: "v3applicationcredential"   
        auth:  
            auth_url: 'https://identity.kr-central-1.kakaoi.io/v3'  
            application_credential_id: "${사용자 액세스 키 ID}"  
            application_credential_secret: "${사용자 액세스 보안 키}"  
EOF  
````
> 인증 단계에서는 카카오 i 클라우드 ‘사용자 엑세스 키 ID 및 ‘사용자 액세스 보안 키’가 필요합니다.


## Step 3. 생성할 클라우드 리소스 정의하기
> Openstack Provider 스펙을 참고
* [kic_simple 폴더](kic-simple/*)
* require.tf : Terraform 버전과 provider 등 실행에 필요한 정보를 작성
* variables.tf : 리소스를 생성하는데 사용할 변수를 정의
* data.tf : 필요한 클라우드 데이터를 내용에 맞게 작성
* resources.tf : 생성할 클라우드 리소스를 작성
* instance.tf : 생성할 인스턴스의 정보로 작성한 값들

## Step 4. Terraform 활용하기
Terraform를 활용해 실행 계획을 클라우드에 적용하기
1. Terraform이 이전에 작성한 설정을 참조할 수 있도록 다음 명령어를 사용합니다.  
````export OS_CLOUD=hands-on  ````
2. 현재 작업 디렉토리를 초기 설정합니다.  
````terraform init  ````
3. 아래 명령어를 통해 실행 계획을 만듭니다. 인프라에 적용할 변경 사항을 미리 확인할 수 있습니다.  
````terraform plan  ````
4. 실행 계획을 클라우드에 적용합니다.  
````terraform apply  ````

## Step 5. 생성된 클라우드 리소스 확인하기

> 실습 후 아래 명령어를 이용하여 생성된 리소스를 제거합니다.  
```terraform destroy```