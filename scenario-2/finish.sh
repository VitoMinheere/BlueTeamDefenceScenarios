#!/bin/bash
set -e

# Variables
TARGET_NAME=target
ATTACKER_NAME=attacker
BACKDOOR_USER=eviluser
CRON_PATH=/etc/cron.d/backdoor
PASSWD_PATH=/etc/passwd


# Check if attacker container is stopped
if docker ps --format '{{.Names}}' | grep -q "^$ATTACKER_NAME$"; then
  echo "[-] Attacker container is STILL running."
  ATTACKER_STOPPED=0
else
  echo "[+] Attacker container is stopped."
  ATTACKER_STOPPED=1
fi

# Check that cronjob file is removed
if docker exec $TARGET_NAME test ! -f $CRON_PATH; then
  echo "[+] Backdoor cronjob has been removed from $CRON_PATH."
  CRON_REMOVED=1
else
  echo "[-] Backdoor cronjob still exists at $CRON_PATH."
  CRON_REMOVED=0
fi

# Check that backdoor user is removed
if docker exec $TARGET_NAME sh -c "! grep -q '^$BACKDOOR_USER:' $PASSWD_PATH"; then
  echo "[+] Backdoor user '$BACKDOOR_USER' has been removed from $PASSWD_PATH."
  USER_REMOVED=1
else
  echo "[-] Backdoor user '$BACKDOOR_USER' still present in $PASSWD_PATH."
  USER_REMOVED=0
fi

# Check that /tmp/pwned-lab is removed
if docker exec $TARGET_NAME test ! -f /tmp/pwned-lab; then
  echo "[+] /tmp/pwned-lab has been removed."
  PWNED_REMOVED=1
else
  echo "[-] /tmp/pwned-lab still exists."
  PWNED_REMOVED=0
fi

# Handle --hint flag
if [[ "$1" == "--hint" ]]; then
  echo "\nHINT:"
  echo "To remove all traces of the attack from the target container, you must:"
  echo "- Delete the cronjob file at /etc/cron.d/backdoor."
  echo "- Remove the backdoor user (eviluser) from /etc/passwd."
  echo "- Delete the file /tmp/pwned-lab."
  echo "\nNote: There is NO text editor installed in the target container. You will need to use command-line tools like awk, sed, or echo to manipulate files. For example, use sed to delete a line from /etc/passwd, or rm to remove files."
  exit 0
fi

# Win condition
if [ $ATTACKER_STOPPED -eq 1 ] && [ $CRON_REMOVED -eq 1 ] && [ $USER_REMOVED -eq 1 ] && [ $PWNED_REMOVED -eq 1 ]; then
  echo -e "\n*** WIN: All traces of the attack have been removed and attacker is stopped! ***"
  echo "[+] Shutting down containers..."
  docker-compose down
else
  echo -e "\n[!] Win condition NOT met."
fi 


