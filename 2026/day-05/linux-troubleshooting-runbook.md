# Day 05 — Linux Troubleshooting 🐧

Today I practiced basic Linux troubleshooting on an Ubuntu EC2 instance.

The main goal was to understand what to check when something is not working properly on a Linux server instead of immediately trying to restart or change things.

## What I Practiced

### 1. System Information

I started by checking the basic health and information of the server.

```bash
uptime
uname -a
```

* `uptime` → Shows how long the system has been running and the system load.
* `uname -a` → Displays detailed information about the Linux kernel and system.

### 2. CPU & Memory

To understand how the server resources are being used:

```bash
top
free -h
```

* `top` → Shows running processes and real-time CPU and memory usage.
* `free -h` → Shows RAM and swap memory usage in a human-readable format.

These commands help identify whether high resource usage could be causing a problem.

### 3. Disk & Storage

I checked filesystem and disk usage using:

```bash
df -h
lsblk
du -sh /var/log
```

* `df -h` → Shows available and used space on mounted filesystems.
* `lsblk` → Displays disks, partitions and block devices.
* `du -sh /var/log` → Shows how much space the log directory is using.

A full disk can cause unexpected problems, so checking storage is an important part of troubleshooting.

### 4. Network Troubleshooting

I also practiced checking network interfaces and connectivity:

```bash
ip addr
ss -tulpn
ping 8.8.8.8
curl https://example.com
```

* `ip addr` → Displays network interfaces and IP addresses.
* `ss -tulpn` → Shows listening ports and network connections.
* `ping` → Helps test network connectivity.
* `curl` → Can be used to test whether a website or HTTP service is responding.

### 5. Services

For checking Linux services:

```bash
systemctl status docker
```

This helps determine whether a service is running, stopped, or has encountered an issue.

### 6. Logs

Logs are one of the most useful sources of information during troubleshooting.

I practiced:

```bash
journalctl
journalctl -u docker
dmesg
```

* `journalctl` → Reads logs collected by `systemd`.
* `journalctl -u docker` → Shows logs related to the Docker service.
* `dmesg` → Displays messages from the Linux kernel.

## What I Learned

The biggest takeaway from this task was that **troubleshooting is a process, not a guess.**

When something fails, I should first collect information:

**System → CPU/Memory → Disk → Network → Services → Logs**

Only after understanding the problem should I decide what action to take.

This exercise also helped me become more comfortable working with Linux from the command line and understanding what different commands tell me about a server.

### Key Takeaway

> **Check first. Understand the problem. Then take action.**

## Repository

My Day 05 work is available here:

https://github.com/Aniket7293a/90DaysOfDevOps/tree/master/2026/day-05

## Challenge

**90 Days of DevOps**

#90DaysOfDevOps #DevOpsKaJosh #TrainWithShubham #DevOps #Linux #AWS #EC2 #LearningInPublic
