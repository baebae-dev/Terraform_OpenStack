state_pull() {
    echo ">> state pull"
    cd ..
    cp terraform.tfstate ./state_merge/"$1"
    cd ./state_merge
    return 0
}

state_resource_counting(){
  echo ">> state_resource_counting"
  terraform state list -state="$1" > source-resource.txt
  terraform state list -state="$2" > dest-resource.txt
  wc -l source-resource.txt
  wc -l dest-resource.txt
}

state_mv(){
  echo ">> state_mv"
  for i in $(terraform state list -state="$1"); do
    terraform state mv -state="$1" -state-out="$2" "$i" "$i"
  done
}

state_after_mv(){
  echo ">> state_after_mv"
  terraform state list -state="$2" > dest2-resource.txt
  wc -l dest2-resource.txt
}

state_remote_save(){
  cd ..
  cp ./state_merge/"$2" "$2"
  sh backend.sh
}

state_cleanup(){
  echo ">> cleanup"
  cd ./state_merge
  rm *.backup
  rm *.txt
}

echo "> START"
state_pull "$1"
state_resource_counting "$1" "$2"
state_mv "$1" "$2"
state_after_mv "$2"
state_remote_save "$2"
state_cleanup
echo "> FINISHED"