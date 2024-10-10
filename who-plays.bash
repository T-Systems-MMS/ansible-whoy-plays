#!/bin/bash
# author: moha
# script checks if role is used in any playbooks

search_string=$1
# if no role was provided set role to "-all"
search_string=${search_string:-"-all"}

playbooks_path="/etc/ansible/playbooks/*"
roles_path="/etc/ansible/roles/*"

# if no role was provided: Find all roles that are not used by any playbooks
if [ $search_string == "-all" ]; then
  for role in $roles_path
  do
    # check if role plays
    grep -R -l ${role##*/} $playbooks_path | grep -v -q "#"
    if [ $? -eq 1 ]; then
      echo "${role##*/} does not play"
    fi
  done
  exit 0
fi

# if a role was provided: Find all playbooks that use the given role
grep -R -l $search_string $playbooks_path | grep -v "#"
if [ $? -eq 1 ]; then
  echo "$search_string does not play"
fi
exit 0
