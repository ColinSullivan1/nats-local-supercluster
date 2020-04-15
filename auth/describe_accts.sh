#!/bin/sh

# generate the files here
export NKEYS_PATH=`pwd`/nkeys
export NSC_HOME=`pwd`/nsc

nsc describe account myaccount
read -p "Press enter to continue"
nsc describe account myaccount2
