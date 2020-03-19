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

# Generate our auth file
nsc generate config --mem-resolver --config-file auth.conf

echo "Remember to Add the system account to auth.conf"
