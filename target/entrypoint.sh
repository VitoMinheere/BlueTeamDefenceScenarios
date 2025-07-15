#!/bin/bash
sudo rsyslogd
service ssh start
# Keep container running
tail -f /dev/null