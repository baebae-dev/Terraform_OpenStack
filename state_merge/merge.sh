state_pull() {
    echo ">> state pull"
    cd ..
    cp terraform.tfstate ./state_merge/source.tfstate
    cd ./state_merge
    return 0
}

state_resource_counting(){
  echo ">> state_resource_counting"
  terraform state list -state=source.tfstate > source-resource.txt
  terraform state list -state=${destfile} > dest-resource.txt
  wc -l source-resource.txt
  wc -l dest-resource.txt
}

state_mv(){
  echo ">> state_mv"
  for i in $(terraform state list -state=source.tfstate); do
    terraform state mv -state=source.tfstate -state-out=${destfile} "$i" "$i"
  done
}

state_after_mv(){
  echo ">> state_after_mv"
  terraform state list -state=${destfile} > dest2-resource.txt
  wc -l dest2-resource.txt
}

state_remote_save(){
  echo ">> state_remote_save"
  cd ..
  cp ./state_merge/${destfile} ${destfile}
  sh backend.sh
}

state_cleanup(){
  echo ">> cleanup"
  cd ./state_merge
  rm *.backup
  rm *.txt
}

echo "> START"
export destfile="terraform.tfstate"
state_pull source.tfstate
state_resource_counting source.tfstate ${destfile}
state_mv source.tfstate ${destfile}
state_after_mv ${destfile}
state_remote_save ${destfile}
state_cleanup
echo "> FINISHED"