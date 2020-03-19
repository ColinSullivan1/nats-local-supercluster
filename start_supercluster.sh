#!/bin/sh

mkdir -p logs
rm logs/*

nats-server -config region1/server_r1_a.conf &
nats-server -config region1/server_r1_b.conf &
nats-server -config region1/server_r1_c.conf &

nats-server -config region2/server_r2_a.conf &
nats-server -config region2/server_r2_b.conf &
nats-server -config region2/server_r2_c.conf &

nats-server -config region3/server_r3_a.conf &
nats-server -config region3/server_r3_b.conf &
nats-server -config region3/server_r3_c.conf &

