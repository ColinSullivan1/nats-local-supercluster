#!/bin/sh

# generate the files here
export NKEYS_PATH=`pwd`/nkeys
export NSC_HOME=`pwd`/nsc

mkdir -p $NKEYS_PATH
mkdir -p $NSC_HOME

# setup the operator
nsc add operator myoperator

# create a system user for monitoring
nsc add account SYS
nsc add user SYS

# create an account and user
nsc add account myaccount
nsc add user    myuser
nsc add export --name help --subject help --service
nsc edit export -n help --latency help.latency --sampling 100

MY_ACCT=$(nsc describe account myaccount --field sub | tr -d \")

nsc add account myaccount2
nsc add user    myuser
nsc add import --src-account $MY_ACCT --remote-subject help --service

# Generate our auth file
nsc generate config --mem-resolver --config-file auth.conf

SYS_ACCT=$(nsc describe account SYS --field sub | tr -d \")
echo "system_account: $SYS_ACCT" >> auth.conf
