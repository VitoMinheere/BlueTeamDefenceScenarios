#!/bin/bash
set -e

# Start SSH on port 2233
/usr/sbin/sshd -p 2233

# Print info
echo "[+] SSH server started on port 2233 for user blueuser (password: bluepass)"
echo "[+] Docker socket should be mounted at /var/run/docker.sock"

# Keep container running
exec tail -f /dev/null 