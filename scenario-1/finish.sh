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

if [[ $1 == "--hint" ]]; then
  echo "🧠 Hint: Try checking /var/log/auth.log for repeated login failures."
  echo "Use tools like 'ss -tnp', 'netstat -anp', or 'fail2ban-client status'"
  echo "Look at sshd_config—root login might be allowed."
  echo "Use iptables or UFW to block bad IPs."
  exit 0
fi