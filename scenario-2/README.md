# Scenario 2: Docker Socket Attack and Defense

## Overview
This scenario demonstrates a container breakout attack using Docker socket abuse, and the corresponding defense/cleanup steps.

- **Attacker**: Attempts to backdoor the target container by adding a cronjob, a root user, and writing to /tmp using access to the Docker socket.
- **Target**: The victim container.
- **Win Condition**: The scenario is considered successfully defended when all traces of the attack are removed from the target and the attacker container is stopped.

---

## Attack Steps
1. The attacker container is started with access to the Docker socket (`/var/run/docker.sock`).
2. The attacker uses the Docker CLI to execute commands in the target container:
    - Adds a cronjob to `/etc/cron.d/backdoor` that writes "pwned" to `/tmp/pwned-lab` every minute.
    - Adds a root user to `/etc/passwd`.
3. The attacker container monitors for success, then exits.

---

## Win Condition
The scenario is considered **defended** (win) when:
- The attacker container is stopped.
- On the target container:
    - `/etc/cron.d/backdoor` does **not** exist.
    - The backdoor user is **not** present in `/etc/passwd`.
    - `/tmp/pwned-lab` does **not** exist.

---

## How to Run

1. **Start the scenario:**
   ```sh
   ./start_scenario.sh
   ```

2. **Observe the attack:**
   - The attacker will attempt to backdoor the target using the Docker socket.
   - You can inspect the target container to see the cronjob, user, and /tmp file appear.

3. **Defend/Clean up:**
   - Remove the cronjob file from `/etc/cron.d/backdoor` in the target.
   - Remove the backdoor user from `/etc/passwd` in the target.
   - Remove `/tmp/pwned-lab` from the target.
   - Stop the attacker container.

4. **Check win condition and clean up:**
   ```sh
   ./finish.sh
   ```
   - If all traces are removed and the attacker is stopped, you will see a WIN message and the scenario will be cleaned up.

---

## Cleanup
- The `finish.sh` script will stop and remove all containers and resources for this scenario.
- You can also run `docker-compose down` manually if needed.

---

## Files
- `attacker/attack.sh`: Attack logic using Docker socket.
- `defender/setup.sh`: (If present) Defense or cleanup logic.
- `finish.sh`: Checks win condition and cleans up.
- `docker-compose.yml`: Scenario container definitions. 