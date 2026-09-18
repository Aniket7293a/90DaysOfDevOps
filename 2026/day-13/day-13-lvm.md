# Day 13 – Linux Volume Management (LVM)

## 🎯 Objective

Today I learned **Linux Logical Volume Management (LVM)** using an AWS **EBS volume** attached to my EC2 instance.

I practiced:

- Creating Physical Volumes (PV)
- Creating Volume Groups (VG)
- Creating Logical Volumes (LV)
- Formatting and mounting volumes
- Extending storage dynamically

---

## Step 1 – Switch to Root User

```bash
sudo -i
```

OR

```bash
sudo su
```

---

# Task 1 – Check Current Storage

### 📸 Task 1 Screenshot
![Day 13 Task 1](./images/day13%20task1.png)

## Check Available Disks

```bash
lsblk
```

Example:

```text
NAME         SIZE TYPE MOUNTPOINT
nvme0n1       20G disk
├─nvme0n1p1    1G part /boot
└─nvme0n1p2   19G part /
nvme1n1       10G disk
```

Here:

- `nvme0n1` → Main OS disk
- `nvme1n1` → Newly attached AWS EBS volume

## Check Existing Physical Volumes

```bash
pvs
```

## Check Existing Volume Groups

```bash
vgs
```

## Check Existing Logical Volumes

```bash
lvs
```

## Check Disk Usage

```bash
df -h
```

These commands help verify the current storage configuration before creating LVM components.

---

# Task 2 – Create Physical Volume

### 📸 Task 2 Screenshot
![Day 13 Task 2](./images/day13%20task2.png)

Create a Physical Volume from the newly attached EBS disk:

```bash
pvcreate /dev/nvme1n1
```

Verify it:

```bash
pvs
```

A Physical Volume is the disk or partition that is prepared for use by LVM.

---

# Task 3 – Create Volume Group

### 📸 Task 3 Screenshot
![Day 13 Task 3](./images/day13%20task3.png)

Create a Volume Group using the Physical Volume:

```bash
vgcreate devops-vg /dev/nvme1n1
```

Verify:

```bash
vgs
```

A **Volume Group (VG)** combines Physical Volumes into a storage pool from which Logical Volumes can be created.

---

# Task 4 – Create Logical Volume

### 📸 Task 4 Screenshot
![Day 13 Task 4](./images/day13%20task4.png)

Create a 500 MB Logical Volume:

```bash
lvcreate -L 500M -n app-data devops-vg
```

Verify:

```bash
lvs
```

A **Logical Volume (LV)** works like a flexible virtual partition created from the Volume Group.

---

# Task 5 – Format and Mount Logical Volume

### 📸 Task 5 Screenshot
![Day 13 Task 5](./images/day13%20task5.png)

## Format with EXT4

```bash
mkfs.ext4 /dev/devops-vg/app-data
```

## Create Mount Directory

```bash
mkdir -p /mnt/app-data
```

## Mount the Logical Volume

```bash
mount /dev/devops-vg/app-data /mnt/app-data
```

## Verify

```bash
df -h /mnt/app-data
```

The Logical Volume is now formatted and available for storing data.

---

# Task 6 – Extend the Logical Volume

### 📸 Task 6 Screenshot
![Day 13 Task 6](./images/day13%20task6.png)

Extend the Logical Volume by 200 MB:

```bash
lvextend -L +200M /dev/devops-vg/app-data
```

After increasing the Logical Volume, the EXT4 filesystem also needs to be resized.

## Resize the Filesystem

```bash
resize2fs /dev/devops-vg/app-data
```

Verify the new size:

```bash
df -h /mnt/app-data
```

### 💡 Important

`lvextend` increases the **Logical Volume size**, while `resize2fs` expands the **EXT4 filesystem** so it can use the additional storage.

---

# 🔧 Important LVM Commands

| Command | Purpose |
|---|---|
| `lsblk` | Show block devices |
| `pvs` | Show Physical Volumes |
| `vgs` | Show Volume Groups |
| `lvs` | Show Logical Volumes |
| `pvcreate` | Create Physical Volume |
| `vgcreate` | Create Volume Group |
| `lvcreate` | Create Logical Volume |
| `mkfs.ext4` | Format filesystem |
| `mount` | Mount filesystem |
| `lvextend` | Extend Logical Volume |
| `resize2fs` | Resize EXT4 filesystem |
| `df -h` | Check disk usage |

---

# 🧠 LVM Structure

The basic LVM flow is:

```text
AWS EBS Disk
     ↓
Physical Volume (PV)
     ↓
Volume Group (VG)
     ↓
Logical Volume (LV)
     ↓
Filesystem (EXT4)
     ↓
Mount Point
```

---

# 📚 What I Learned

## 1. LVM Makes Storage Flexible

LVM allows storage to be managed and resized more easily compared to traditional partitioning.

## 2. Three Main LVM Components

- **PV – Physical Volume**
- **VG – Volume Group**
- **LV – Logical Volume**

## 3. Filesystem Resizing

After extending an EXT4 Logical Volume, `resize2fs` allows the filesystem to use the newly available space.

## 4. AWS + LVM Practice

I practiced LVM using a newly attached **AWS EBS volume on an EC2 instance**, giving me hands-on experience with cloud storage management.

---

# ✅ Key Takeaway

LVM provides a flexible way to manage Linux storage and makes it easier to increase storage capacity as requirements grow.

**Disk → PV → VG → LV → Filesystem → Mount**

---

## 🔗 GitHub

https://github.com/Aniket7293a/90DaysOfDevOps/tree/master/2026/day-13

---

#90DaysOfDevOps #DevOpsKaJosh #TrainWithShubham
