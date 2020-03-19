# A Local Supercluster

This sets up a completely local supercluster on bare metal for testing, demonstrations,
etc. It relies ports rather than hostnames to differentiate clusters.  One could add
entries into `/etc/hosts` to simulate different hostnames, but ports would still need to
change for a completely local setup.  This is a toy configuration, use at your own risk.  If
taking this to apply to different hosts, I highly suggest standardizing on ports so the only
really differences are IPs or hostnames.

## Prerequisites

* The [NATS server](https://github.com/nats-io/nats-server)
* `nats-sub` and `nats-pub` from the [nats.go](https://github.com/nats-io/nats.go) examples, or your favorite NATS publisher and subscriber.
* If updating credentianls, the [nsc](https://github.com/nats-io/nsc) command line tool.

## Cluster configuration

This is setup with three regions: region1, region2, and region3. Each region consists
of a standard full mesh three node NATS cluster.  Connectivity between regions are configured
with gateways to create a supercluster.

Breaking with NATS tradition, ports do not use "22" in them.  Rather than hostnames,
I'll use ports to differentiate clusters.  In an actual deployment, good practice
is to standardize on the same port for each node.

### Ports

|  Server             | Client | Route | Gateway | Monitoring |
|  ---                |  ---   | ---   | ---     | ---        |
| Region 1 - Server A | 4000   | 4400  | 4500    | 4800       |
| Region 1 - Server B | 4001   | 4401  | 4501    | 4801       |
| Region 1 - Server C | 4002   | 4402  | 4502    | 4802       |
|                     |        |       |         |            |
| Region 2 - Server A | 5000   | 5400  | 5500    | 5800       |
| Region 2 - Server B | 5001   | 5401  | 5501    | 5801       |
| Region 2 - Server C | 5002   | 5402  | 5502    | 5802       |
|                     |        |       |         |            |
| Region 3 - Server A | 6000   | 6400  | 6500    | 6800       |
| Region 3 - Server B | 6001   | 6401  | 6501    | 6801       |
| Region 3 - Server C | 6002   | 6402  | 6502    | 6802       |

## Structure

This directory, containing this README file is the root of this
configuration setup.

The region directories contain the configuration files for
each server in the assoiciated "region".

The [gateways.conf](gateways.conf) configuration file is shared
amongst the server configurations containing a list of all available
gateways.  Servers are smart enough to ignore their own gateway.

## Starting the supercluster

From **this directory**, run:

`./start_supercluster.sh`

You should see nine `nats-server` processes started.  If not, check out the logs
in the log direcotry.

To stop the supercluster (and all servers on your machine) run:

`./stop_supercluster.sh`

## Sanity Check

Subscribe to various servers and ensure messages flow...

`nats-sub -creds auth/nkeys/creds/myoperator/myaccount/myuser.creds -s "localhost:5000" foo &`
`nats-sub -creds auth/nkeys/creds/myoperator/myaccount/myuser.creds -s "localhost:6001" foo &`

`nats-pub -creds auth/nkeys/creds/myoperator/myaccount/myuser.creds -s "localhost:4002" foo hello`

From here, experiment with queue subs local to and remote from the publisher
to see how configuration-less DR works.

## Credentials

Credentials used to connect are:
- User: `auth/nkeys/creds/myoperator/myaccount/myuser.creds`
- System: `auth/nkeys/creds/myoperator/SYS/SYS.creds`


