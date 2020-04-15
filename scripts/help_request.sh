#!/bin/sh

nats-req -s "localhost:4000" --creds ./auth/nkeys/creds/myoperator/myaccount2/myuser.creds help "help me!"

