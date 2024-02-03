#!/usr/bin/env bash

if [[ ! -d /data/backend ]]; then
  mkdir -p /data/backend
fi

if [[ ! -d /data/blockbook ]]; then
  mkdir -p /data/blockbook
fi

bash -c "/opt/coins/nodes/primeai/primeaid -datadir=/data/backend -conf=/opt/coins/nodes/primeai/primeai.conf -pid=/run/primeai/primeai.pid"

cd /opt/coins/blockbook/primeai/

bash -c "/opt/coins/blockbook/primeai/bin/blockbook -blockchaincfg=/opt/coins/blockbook/primeai/config/blockchaincfg.json -datadir=/data/blockbook -sync -internal=:9068 -public=:9168 -certfile=/opt/coins/blockbook/primeai/cert/blockbook -explorer= -log_dir=/data/blockbook/logs"
