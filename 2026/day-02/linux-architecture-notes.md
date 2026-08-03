# 🐧 Day 2 – Linux Architecture, Processes & systemd

## 📌 Objective

Today's goal was to understand how Linux works behind the scenes and learn the basic concepts that every DevOps Engineer should know.

---

#  Linux Architecture

Linux can be divided into four main layers:

```text
Application
     │
User Space (Shell, Libraries, Utilities)
     │
Linux Kernel
     │
Hardware
```

### 1. Kernel

The **Kernel** is the core of the Linux operating system. It acts as a bridge between software and hardware.

Its main responsibilities are:

* Process Management
* Memory Management
* File System Management
* Device Management
* Networking

---

### 2. User Space

User Space is where users and applications run.

Examples include:

* Bash
* Git
* Docker
* Python
* Nginx

Applications cannot access hardware directly. They communicate with the kernel through system calls.

---

### 3. Shell

The **Shell** allows users to interact with Linux using commands.

For example:

```bash
ls
```

The shell reads the command, asks the kernel to execute it, and then displays the output.

---

### 4. systemd

`systemd` is the default init system in most Linux distributions.

It is the first process started by the kernel (**PID 1**) and is responsible for:

* Starting the operating system
* Managing services
* Restarting failed services
* Viewing system logs

Some useful commands:

```bash
systemctl status nginx
systemctl start nginx
systemctl stop nginx
systemctl restart nginx
journalctl -u nginx
```

---

# ⚙️ Linux Processes

A **process** is simply a running program.

Every process has:

* PID (Process ID)
* Parent Process
* Memory usage
* CPU usage

### Common Process States

* Running (R)
* Sleeping (S)
* Stopped (T)
* Zombie (Z)

---

# 💻 Commands I Practiced Today

```bash
ps aux          # View running processes
top             # Monitor system resources
systemctl       # Manage services
grep            # Search text
chmod           # Change file permissions
```

---

# 📖 Key Takeaways

* The **Kernel** manages hardware and system resources.
* The **Shell** acts as a bridge between the user and the kernel.
* **systemd** is responsible for booting Linux and managing services.
* Every running application is a process with its own PID.
* Understanding these concepts will make Linux troubleshooting much easier.

---

## 🚀 Final Thoughts

Before today, I mostly used Linux commands without thinking about what happened in the background.

Now I have a better understanding of how the kernel, shell, processes, and systemd work together. This knowledge will help me as I continue learning Linux, DevOps, and Cloud technologies.

**Day 2 Complete ✅**
