#!/bin/bash

nats-pub -s localhost:4000 -creds auth/nkeys/creds/myoperator/myaccount/myuser.creds foo hello

