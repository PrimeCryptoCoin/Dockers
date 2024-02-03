#!/usr/bin/env bash

if [[ ! -d /data/node ]]; then
  mkdir -p /data/node
fi

if [[ ! -f /data/node/primeai.conf ]]; then
echo -e "Creating config file..."
mkdir /data > /dev/null 2>&1
mkdir /data/node > /dev/null 2>&1
touch /data/node/primeai.conf
cat <<- EOF > /data/node/primeai.conf
rpcuser=${RPC_USER:-PrimeaiDockerUser}
rpcpassword=${RPC_PASS:-PrimeaiDockerPassword}
listen=1
daemon=0
server=1
rest=1
dbcache=16
rpcworkqueue=1024
rpcthreads=64
rpcallowip=0.0.0.0/0
disablewallet=1
rpcbind=0.0.0.0
txindex=1
assetindex=1
addressindex=1
timestampindex=1
rpcservertimeout=240
EOF
fi

echo -e "Starting Primeai node daemon..."
bash -c "primeaid -datadir=/data/node"