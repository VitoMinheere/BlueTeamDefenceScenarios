#!/bin/bash
docker-compose up -d --build

echo "========================================"
echo "Blue Team Scenario: SSH Brute-Force Attack"
echo "----------------------------------------"
echo "1. SSH into the target: ssh blueuser@localhost -p 2222 (password: bluepass)"
echo "2. Investigate and stop the brute-force attack from 172.30.0.100."
echo "3. When you believe the attack is stopped, run ./finish.sh"
echo "========================================"
