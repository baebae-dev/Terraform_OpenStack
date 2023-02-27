# Terraform으로 공공 클라우드 설치하기

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
│
├──  module-example
│   ├── kic-simple                               # kic vm 생성 소스
│   ├── govkic                                   # gov kic 컴포넌트, 환경별 모듈 소스
│   │   ├── env                     
│   │   └── modules 
│   └── module-example                           # 환경 모듈 공통화 소스
│       ├── kic-cbt                        
│       ├── kic-prod                        
│       └── module  
└──                        
```