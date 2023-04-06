## 역할
원격 상태파일을 사용하여 타 사용자가 컴포넌트를 만들경우 여러개의 상태파일이 생성된다.   
이 경우, 여러개의 상태파일을 merge하는 작업이 필요  

2개의 상태파일을 merge 후 원격 상태파일 업로드까지 진행. 

## 여러 상태파일 merge  
### prerequire   
merge할 기존 상태파일을 object storage에서 다운받아 /state_merge 폴더로 가져옴.   
```
sh merge.sh {새 상태파일} {기존 상태파일}       
ex. sh merge.sh source.tfstate terraform.tfstate 
```

## 파일 내 함수 설명
1. state_pull   
   : 현 상태의 원격 상태파일 merge 작업 폴더로 이전 

2. state_resource_counting  
   : merge할 두 상태파일 각각의 resource 개수 count  

3. state_mv   
   : 두 상태파일 merge

4. state_after_mv
   : merge 후 resource 개수 count

5. state_remote_save
   : merge한 상태파일 원격 저장소에 저장

6. state_cleanup
   : merge 과정 생성 파일 삭제

