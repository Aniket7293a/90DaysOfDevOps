# 🚀 Day 07 – Linux File System & Troubleshooting

## 📌 What I practiced

Today I learned where important files and folders are stored in Linux and practiced a few basic troubleshooting scenarios.

### 📁 Linux File System

| Directory  | Use                                    |
| ---------- | -------------------------------------- |
| `/`        | Starting point of the Linux filesystem |
| `/home`    | User files and personal directories    |
| `/root`    | Home directory of the root user        |
| `/etc`     | Configuration files                    |
| `/var/log` | System and application logs            |
| `/tmp`     | Temporary files                        |
| `/bin`     | Essential system commands              |
| `/usr/bin` | Common user commands                   |
| `/opt`     | Optional or third-party applications   |

Some commands I used:

```bash
ls -l /etc
ls -l /var/log
cat /etc/hostname
ls -la ~
```

To check the largest log directories/files:

```bash
du -sh /var/log/* 2>/dev/null | sort -h | tail -5
```

---

## 🔧 Troubleshooting Practice

### 1. Check a Service

```bash
systemctl status nginx
systemctl is-enabled nginx
```

I used these to check whether a service is running and whether it starts automatically after reboot.

### 2. Check High CPU Usage

```bash
top
ps aux --sort=-%cpu | head -10
```

These commands help identify which process is consuming more CPU.

### 3. Check Service Logs

```bash
journalctl -u ssh -n 50
journalctl -u ssh -f
```

`journalctl` helped me check logs for a systemd-managed service.

### 4. Fix Permission Issue

```bash
ls -l backup.sh
chmod +x backup.sh
./backup.sh
```

Here I checked the permissions, added execute permission, and then tried running the script.

---

## 🎯 My Takeaway

Day 07 helped me understand that knowing **where files are located** is important when troubleshooting Linux servers.

Instead of randomly trying commands, I’m learning to follow a simple approach:

**Check → Understand → Troubleshoot → Verify**

**Day 07/90 ✅ 🐧**
