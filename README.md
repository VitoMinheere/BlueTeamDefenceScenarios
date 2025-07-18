# 🛡️ Blue Team Defence Scenarios

**Hands-on, live-fire labs for defenders.**  
Train your detection, response, and hardening skills against simulated real-world attacks—all from your terminal.

---

## 💡 What is This?

**Blue Team Defence Scenarios** is a collection of practical, self-contained security labs where you take the role of a system defender.

Each scenario spins up a real attacker and vulnerable target in Docker, and challenges you to detect, investigate, and stop the breach using Linux tools and your own knowledge.

Think of it as your own personal incident response war room—no cloud required.

---

## 🔧 How it Works

Each scenario includes:

- A vulnerable target (e.g., misconfigured SSH, exposed cronjobs)
- An attacker container running a scripted or live attack
- A `start_scenario.sh` script to spin it all up
- A `finish.sh` script to validate whether you've successfully stopped the attack

You get SSH access to the target and must respond using standard command-line tools—just like in real life.

---

## 📦 Available Scenarios

| Scenario | Focus Area | Status |
|----------|------------|--------|
| [01 - SSH Brute-Force Attack](./scenario-1) | Log analysis, blocking, SSH hardening | ✅ Released |
| [02 - Lateral Movement (Docker socket)](./scenario-2/) | Container abuse, privilege escalation |  ✅ Released |
| 03 - Log Tampering | Spot signs of tempered logs | 🛠️ Coming soon |

---

## 🚀 Get Started

```bash
git clone https://github.com/VitoMinheere/BlueTeamDefenceScenarios.git
cd BlueTeamDefenceScenarios/scenario-1
./start_scenario.sh
```

---

## 🧪 Next Steps

🚧 More scenarios coming soon:

* Log tampering
* Malware persistence
* Cloud misconfigurations

---

## 🤝 Contributing / Feedback

Open an issue, drop feedback, or reach out on LinkedIn: [Vito Minheere](https://www.linkedin.com/in/vitominheere)

---

