#!/bin/sh

check_errs() {
  if [ "${1}" -ne "0" ]; then
    echo "ERROR # ${1} : ${2}"
    exit ${1}
  fi
}

echo "building project..."
mvn clean install $1
check_errs $? "errors in project"

echo "deploy..."
mvn appengine:update $1
check_errs $? "error in deployment"