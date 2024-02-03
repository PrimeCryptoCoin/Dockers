#!/usr/bin/env bash

if [[ ! -f /root/.primeai/primeai.conf ]]; then
echo -e "Creating config file..."
mkdir /root/.primeai > /dev/null 2>&1
touch /root/.primeai/primeai.conf
cat <<- EOF > /root/.primeai/primeai.conf
rpcuser=${RPC_USER:-PrimeaiDockerUser}
rpcpassword=${RPC_PASS:-PrimeaiDockerPassword}
listen=1
daemon=1
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
spentindex=1
rpcservertimeout=240
EOF
fi

cd /root
mkdir /root/electrumdb > /dev/null 2>&1

if [[ ! -f /root/electrumdb/server.key ]]; then
  cd /root/electrumdb
  echo -e "Generate SSL certyficate...."
  openssl genrsa -out server.key 2048 > /dev/null 2>&1
  openssl req -new -key server.key -out server.csr -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=primeai.org" > /dev/null 2>&1
  openssl x509 -req -days 2500 -in server.csr -signkey server.key -out server.crt > /dev/null 2>&1
fi

echo -e "Starting daemon and electrumx..."
bash -c "primeaid && python3 /data/electrumx/electrumx_server"