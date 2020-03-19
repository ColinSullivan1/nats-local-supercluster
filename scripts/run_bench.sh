#!/bin/sh

nats-bench -s 127.0.0.1:4000 -n 10000000 -np 0 -ns 1 -creds auth/nkeys/creds/myoperator/myaccount/myuser.creds a &
sleep 1
nats-bench -s 127.0.0.1:6000 -n 10000000 -np 1 -ns 0 -creds auth/nkeys/creds/myoperator/myaccount/myuser.creds a

