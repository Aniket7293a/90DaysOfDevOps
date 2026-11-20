# Day 28: Revision Day (Day 1 to Day 27)

Today was all about going back over everything so far. I went through the checklist, redid the stuff I wasn't fully sure about, answered the quick-fire questions without looking anything up, and tried explaining one topic in simple words. Honestly it felt good to see how much we've covered in 4 weeks.

---

## What we've covered so far

| Days | Topic |
|------|-------|
| 1 | DevOps and cloud intro, SDLC |
| 2-7 | Linux basics, processes, systemd, file system, troubleshooting |
| 8 | Cloud server setup with Docker and Nginx |
| 9-11 | Users, groups, permissions, ownership |
| 12 | Revision day 1 |
| 13 | LVM |
| 14-15 | Networking (DNS, IP, subnets, ports) |
| 16-21 | Shell scripting, cron, log analyzer, cheat sheet |
| 22-25 | Git and GitHub |
| 26 | GitHub CLI |
| 27 | GitHub profile and repo cleanup |

---

## Task 1: Self-assessment

I went through every item on the checklist. Most of it I can do without thinking much, but a few things (cron timing, rebase vs merge, stash) I needed to practice again before I could say I'm confident.

**Linux:** file system navigation, processes, systemd, vim/nano, `top`/`free`/`df`/`du`, users and groups, `chmod`, `chown`, LVM, `ping`/`curl`/`ss`/`dig`, DNS and subnets. All good.

**Shell scripting:** variables, arguments, if/case, loops, functions, `grep`/`awk`/`sed`, `set -euo pipefail`, `trap`, crontab. Good, but cron needed a second look (see below).

**Git and GitHub:** init, commit, branches, push/pull, merge, rebase, stash, cherry-pick, reset, revert, branching strategies, GitHub CLI. Good, rebase and stash needed a recap.

---

## Task 2: Weak spots I went back to

### Cron, the minute field

```bash
* 3 * * *    # every minute between 3:00 and 3:59 (60 runs!)
0 3 * * *    # once, at 3:00 AM
```

This one is sneaky because nothing breaks. Cron just quietly runs the job 60 times. Now I always check that the minute isn't a `*` when I want a daily job.

### chmod vs chown

```bash
chmod 755 script.sh            # what people are allowed to do
sudo chown akash script.sh     # who owns it
sudo chgrp developers script.sh
```

Easy way to remember: chmod = mode (permissions), chown = owner. They never change each other's job.

### Rebase and stash

```bash
git rebase main
git stash list
git stash apply stash@{1}
```

Rebase doesn't actually move your commits. It makes new ones with the same changes on top of a different parent, which is why the hashes change and why you shouldn't rebase a branch other people are using. For stash, `stash@{0}` is the newest one and the number goes up as they get older.

### LVM again, hands-on

```bash
lsblk
sudo pvcreate /dev/sdb
sudo vgcreate devops-vg /dev/sdb
sudo lvcreate -L 500M -n app-data devops-vg
sudo mkfs.ext4 /dev/devops-vg/app-data
sudo mkdir /app-data
sudo mount /dev/devops-vg/app-data /app-data

# extending it later
sudo lvextend -L +200M /dev/devops-vg/app-data
sudo resize2fs /dev/devops-vg/app-data
```

The order that finally stuck in my head: disk, PV, VG, LV, filesystem, mount.

---

## Task 3: Quick-fire questions

1. **chmod 755:** owner gets read, write, execute. Group and others get read and execute only.
2. **Process vs service:** a process is any running program. A service is a background process managed by systemd (`systemctl start/stop/enable`).
3. **Port 8080:** `sudo ss -tulnp | grep :8080`
4. **set -euo pipefail:** stops on errors (`-e`), errors on unset variables (`-u`), and fails a pipeline if any part of it fails (`pipefail`).
5. **reset --hard vs revert:** reset --hard throws away changes and rewrites history. Revert adds a new commit that undoes the old one, so it's safer for shared branches.
6. **Branching for 5 devs shipping weekly:** GitHub Flow. Short feature branches, pull request, review, merge to main.
7. **git stash:** saves uncommitted work so I can switch branches, then `git stash pop` brings it back.
8. **3 AM daily:** `0 3 * * * /path/to/script.sh`
9. **fetch vs pull:** fetch only downloads, pull downloads and merges.
10. **LVM:** flexible storage. You can resize and extend volumes without repartitioning, unlike fixed partitions.

---

## Task 4: Organizing my work

- Daily submissions (day 1 to 27) are pushed
- `git-commands.md` is updated
- Shell scripting cheat sheet is done
- GitHub profile and repos are cleaned up from Day 27

---

## Task 5: Teach it back, LVM

Think of your disks as a few water tanks. With LVM you pour them all into one big reservoir (the volume group). From that reservoir you fill containers of whatever size you want (the logical volumes), and each container gets its own tap (the filesystem and mount point).

If a container runs low, you just top it up with `lvextend`. If the reservoir itself is running low, you add another tank with `vgextend`. With a normal partition the size is fixed once you create it, so growing it is a lot more painful.

That's why LVM is so useful on servers, where storage needs keep changing.

---

## Summary

Day 28 was a good reset. The main things I took away: the cron minute field, chmod vs chown, how rebase and stash really work, and the LVM flow. On to the next topics with a stronger base.
