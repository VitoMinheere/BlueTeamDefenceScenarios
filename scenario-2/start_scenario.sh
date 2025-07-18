#!/bin/bash
set -e

# Variables
NET_NAME=blue-lab-net
SUBNET=172.31.0.0/24
DEFENDER_NAME=defender
ATTACKER_NAME=attacker

# Create Docker network if not exists
docker network inspect $NET_NAME >/dev/null 2>&1 || \
  docker network create --subnet=$SUBNET $NET_NAME

echo "[+] Building containers..."
docker-compose build

echo "[+] Starting containers..."
docker-compose up -d

echo "[+] Lab started. SSH to defender with:"
echo "    ssh blueuser@localhost -p 2233"
echo "    (password: bluepass)" 