#!/bin/sh

nats-req -s "localhost:6000" --creds ./auth/nkeys/creds/myoperator/myaccount2/myuser.creds help "help me!"

