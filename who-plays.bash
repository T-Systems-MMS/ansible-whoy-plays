#!/bin/bash
#author: moha
#script checks if role is used in any playbooks

search_string=$1
Path=/etc/ansible/roles/*
search_string=${search_string:-"-all"}

if [ $search_string == "-all" ]; then
 for f in $Path
 do

  if [ ${f##*/} == "-" ]; then
   continue
  fi


#echo "${f##*/} recieved"

 grep -R -l ${f##*/} /etc/ansible/playbooks/* | grep -v -q "#"
  if [ $? -eq 1 ]; then
   echo "${f##*/} outplays herself"
  fi

  done
 exit 0
fi

grep -R -l $search_string /etc/ansible/playbooks/* | grep -v "#"
if [ $? -eq 1 ]; then
 echo "$search_string outplays herself"
fi
exit 0