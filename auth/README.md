# Instructions

To create credentials, from THIS directory run 

```text
$ ./create_creds.sh 
```

The credentials generated and used to connect will be:

- Regular User:  `./nkeys/creds/myoperator/myaccount/myuser.creds` 
- System User:   `./nkeys/creds/myoperator/SYS/SYS.creds`

An auth.conf used the the servers will contain a system account and a user account with users.

When using nsc for this deployment be sure to set the NKEYS_PATH and NSC_HOME environment variables.

```text
export NKEYS_PATH=`pwd`/nkeys
export NSC_HOME=`pwd`/nsc
```

[create_creds.sh](./create_creds.sh) will create a directory structure like this and generate an
[auth.conf](./auth.conf) file that will be used by each server.

```text
.
├── auth.conf
├── nkeys
│   ├── creds
│   │   └── myoperator
│   │       ├── SYS
│   │       │   └── SYS.creds
│   │       └── myaccount
│   │           └── myuser.creds
│   └── keys
│       ├── A
│       │   ├── CR
│       │   │   └── ACRYKJ75LDV67ROUZPT4ITCNEARJZMAAZ4NNN26LN7ATMLCPX44QUOXT.nk
│       │   └── DQ
│       │       └── ADQVVRPZM6XTMKUVWR7T7BBMFQ4TWIUMR2NKFZLCNGPW55GXKOVZGIL2.nk
│       ├── O
│       │   └── CF
│       │       └── OCFTAXICSA2E2D7O7V5U7DFOQBX7QUQMFICXSB5WYVKMOSWS4LL24ZGA.nk
│       └── U
│           ├── AK
│           │   └── UAKR5XTSQM7HEGYIYBD54L3BDQ6WQOYJOWTB3W2C2BCLVDC6I7WHCHBX.nk
│           └── BB
│               └── UBBGM2HDBPYE7G4PT7IT2QELYMO3J7L5ZCRZ6JDQOEON362RJMG7HCT5.nk
└── nsc
    ├── nats
    │   └── myoperator
    │       ├── accounts
    │       │   ├── SYS
    │       │   │   ├── SYS.jwt
    │       │   │   └── users
    │       │   │       └── SYS.jwt
    │       │   └── myaccount
    │       │       ├── myaccount.jwt
    │       │       └── users
    │       │           └── myuser.jwt
    │       └── myoperator.jwt
    └── nsc.json
```