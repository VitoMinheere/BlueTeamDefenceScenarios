#!/bin/bash

# Validation script for blue team scenario
# Checks if SSH access to the target is blocked

TARGET_IP="172.30.0.10"
SSH_PORT=22

# Allow override for running on the target itself
if [ "$1" != "" ]; then
  TARGET_IP="$1"
fi

# Try to connect to SSH port
nc -z -w 2 "$TARGET_IP" "$SSH_PORT" > /dev/null 2>&1
RESULT=$?

if [ $RESULT -eq 0 ]; then
  echo "FAIL: SSH port $SSH_PORT on $TARGET_IP is still accessible."
  exit 1
else
  echo "SUCCESS: SSH port $SSH_PORT on $TARGET_IP is NOT accessible. Attack stopped."
  exit 0
fi 