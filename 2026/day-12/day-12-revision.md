# 🐧 Day 12 – Linux Revision (Days 01–11)

## 📌 Goal

Day 12 was a revision day for everything I learned during Days 01–11.

I went back through my notes and also practiced the commands on my **AWS EC2 Ubuntu server**. The main focus was revising Linux commands, file permissions, ownership, processes, services, and logs.

---

## ☁️ My Practice Environment

- **Platform:** AWS EC2
- **OS:** Ubuntu
- **Service practiced:** Nginx
- **Focus:** Linux fundamentals and troubleshooting

---

## ⚙️ Processes & Services

I practiced checking running processes and managing services.

### Check Running Processes

```bash
ps aux
```

This helped me see the processes currently running on the server.

### Check Nginx Status

```bash
systemctl status nginx
```

Nginx was running successfully on my EC2 instance.

### Check Nginx Logs

```bash
journalctl -u nginx -n 5
```

I used this to check the latest Nginx service logs and look for any issues.

---

## 📁 File Operations & Permissions

I also revised file operations and permissions.

### Append Text to a File

```bash
echo "Linux Revision" >> notes.txt
```

This added text to `notes.txt` without overwriting the existing content.

### Change File Permissions

```bash
chmod 644 notes.txt
```

I used `chmod` to change the permissions of the file.

### Check Permissions

```bash
ls -l notes.txt
```

`ls -l` is one of the commands I find most useful because it quickly shows file permissions, ownership, and other details.

---

## 🔐 File Ownership

I revised `chown` and practiced changing file ownership.

```bash
sudo chown ubuntu:ubuntu notes.txt
```

Then I verified the changes:

```bash
ls -l notes.txt
```

This helped me understand the relationship between **file ownership and permissions** more clearly.

---

## 📝 Commands I Revised

| Command | What I use it for |
|---|---|
| `ls -l` | Check files, permissions, and ownership |
| `cd` | Move between directories |
| `ps aux` | Check running processes |
| `systemctl status` | Check service status |
| `journalctl` | Check service logs |
| `chmod` | Change file permissions |
| `chown` | Change file ownership |
| `grep` | Search for specific text or patterns |

---

## ⭐ My Most Useful Command

### `ls -l`

Out of the commands I have learned so far, `ls -l` is one of the most useful for me.

```bash
ls -l
```

I can quickly check:

- File permissions
- File owner
- Group
- File size
- File details

---

## 🧪 What I Still Need to Improve

One command I still need more practice with is **`grep`**.

I understand that `grep` is used to search for text or patterns, but I want to become more comfortable using it with different options and commands.

For example:

```bash
cat /etc/passwd | grep -E 'tokyo|berlin|professor'
```

I will keep practicing `grep` while working with Linux files and logs.

---

## 💭 My Progress After 12 Days

After 12 days of practicing Linux, **I feel like I am getting good at it**.

At the beginning, many Linux commands were new to me. After practicing them on AWS EC2, commands related to files, permissions, ownership, services, and logs are becoming more familiar.

I still have things to improve, especially `grep`, but regular practice is helping me understand Linux better.

---

## 🎯 Next Focus

For the next few days, I want to:

- Practice more Linux commands.
- Improve my understanding of `grep`.
- Get better at troubleshooting.
- Continue practicing file permissions and ownership.
- Start focusing more on **Shell Scripting and Automation**.

---

## 🚀 Key Takeaways

- Revised Linux concepts from **Day 01 to Day 11**.
- Practiced commands directly on my **AWS EC2 Ubuntu server**.
- Improved my understanding of file permissions and ownership.
- Practiced checking processes, Nginx services, and logs.
- `ls -l` is currently one of my most useful commands.
- I need more practice with `grep`.
- Consistent practice is making Linux more comfortable for me.

---

## 📈 90 Days of DevOps

**Day 12/90 Completed ✅**

One more day of learning, practicing, and improving.

#90DaysOfDevOps #DevOpsKaJosh #TrainWithShubham
