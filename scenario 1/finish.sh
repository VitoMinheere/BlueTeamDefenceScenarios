#!/bin/bash

# Run validation in attacker container
docker exec ssh-attacker bash /finish.sh
RESULT=$?

if [ $RESULT -eq 0 ]; then
  echo "========================================"
  echo "SUCCESS: You stopped the attack and secured the system!"
  echo "Shutting down the scenario environment..."
  docker-compose down
  echo "========================================"
else
  echo "========================================"
  echo "The attack is still ongoing or SSH is still accessible."
  echo "Try again!"
  echo "========================================"
fi