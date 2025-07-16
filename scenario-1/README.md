# 🛡️ Blue Team Defence Scenarios

**Hands-on labs for practicing real-world defense against active attacks.**

---

## 🔥 Scenario 1: Stop an SSH Brute-Force Attack

An attacker is hammering your server with SSH login attempts.
**Your mission:** Detect the attack and shut it down—before they break in.

---

## 🧠 Learning Outcomes

* Identify brute-force login attempts via logs and system tools
* Trace attacker behavior on a live system
* Apply real-time mitigation techniques:

  * IP blocking
  * SSH hardening
  * Service configuration

---

## 🚀 Quickstart

```bash
git clone https://github.com/VitoMinheere/BlueTeamDefenceScenarios.git
cd BlueTeamDefenceScenarios/scenario-1
./start_scenario.sh
```

> SSH into the target: `ssh blueuser@localhost -p 2222`
> Password: `bluepass`

---

## 🎯 Goal

Stop the attack by securing the system.
Once you believe the attacker is blocked, run:

```bash
./finish.sh
```

---

## 💡 Need a Hint?

```bash
./finish.sh --hint
```
---

## 🛑 Finish Conditions

✅ The attacker can no longer connect via SSH
✅ SSH is hardened or blocked
✅ The attack process is no longer effective

---

## 📦 What’s Inside

* `start_scenario.sh` – Spins up attacker + target containers
* `attacker/` – Brute-force script that simulates a persistent attacker
* `target/` – Vulnerable Ubuntu server with SSH open
* `finish.sh` – Validates that the attack is mitigated

---

