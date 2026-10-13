# Day 18 – Shell Scripting: Functions & Intermediate Concepts

## Objective
Today, I got hands-on experience writing cleaner and reusable Bash scripts using functions, strict mode, local variables, and modular design. I also explored Linux commands in depth and learned how to use them in real-world scenarios like process monitoring, disk management, error handling, and automation. 
---

# Task 1: Basic Functions

## File: functions.sh

```bash
#!/bin/bash 

function greet()
{
        echo "Hello,$1" 
}

function add()
{
        read -p "Enter number 1 :" NUM1
        read -p "Enter number 2 :" NUM2

        echo " total : $((NUM1+NUM2)) "
}

greet "Aniket"
add
```

## Output

```text
Hello,Aniket
Enter number 1 :5
Enter number 2 :55
 total : 60 
```

## Explanation

* `greet()` accepts a name as an argument and prints a greeting.
* `add()` accepts two numbers and prints their sum.
* Functions help avoid repeating code and improve readability.

---

# Task 2: Functions with Return Values

## File: disk_check.sh

```bash
#!/bin/bash 

function check_disk()
{
        echo "Disk usage: "
        df -h /
}

function check_memory()
{
        echo 
        echo "Memory usage"
        free -h 
} 

echo "===== System Resource Check ====="

check_disk
check_memory 


```

## Output

```text
===== System Resource Check =====
Disk usage: 
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        11G  3.1G  7.4G  30% /

Memory usage
               total        used        free      shared  buff/cache   available
Mem:           908Mi       326Mi       221Mi       2.7Mi       472Mi       582Mi
Swap:             0B          0B          0B
```

## Explanation

* `df -h /` displays disk usage for the root filesystem.
* `free -h` displays memory usage in human-readable format.
* Functions make it easier to organize scripts.

---

# Task 3: Strict Mode – set -euo pipefail

## File: strict_demo.sh

```bash
#!/bin/bash 

set -euo pipefail 

NAME="Aniket"
echo "Name : $Name"

cat function.sh | grep "error"
```

## Output

```text
./strict_demo.sh: line 6: Name: unbound variable
```

---

## Demonstrating pipefail

```bash
#!/bin/bash

set -euo pipefail

cat function.sh | grep "error"
echo "Script Completed"
```

## Output

```text
grep: missingfile.txt: No such file or directory
Script exits immediately
```

## What does each flag do?

### set -e

Exit immediately when a command returns a non-zero exit code.

Example:

```bash
false
echo "Will not execute"
```

---

### set -u

Treat undefined variables as errors.

Example:

```bash
echo "$USERNAME"
```

If USERNAME is not defined, the script exits.

---

### set -o pipefail

Makes a pipeline fail if any command within the pipeline fails.

Example:

```bash
cat function.sh | grep "error"

```

With pipefail:

* `grep` fails.
* The entire pipeline fails.

---

# Task 4: Local Variables

## File: local_demo.sh

```bash
#!/bin/bash

demo_local() {
    local NAME="Aniket"
    echo "Inside function: $NAME"
}

demo_global() {
    CITY="Indore"
    echo "Inside function: $CITY"
}

demo_local

echo "Outside function local variable: ${NAME:-Not Available}"

demo_global

echo "Outside function global variable: $CITY"

```

## Output

```text
Inside function: Aniket
Outside function local variable: Not Available
Inside function: Indore
Outside function global variable: Indore

```

## Explanation

* Variables declared using `local` only exist inside the function.
* Regular variables remain available after the function finishes.
* Using local variables prevents accidental overwriting of global variables.

---

# Task 5: System Information Reporter

## File: system_info.sh

```bash
#!/bin/bash 

function print_header()
{
        echo 
        echo "=========================================================="
        echo "          $1"
        echo "=========================================================="
}

function print_hostname()
{
        command hostnamectl | head -10
}

function print_uptime()
{
        command uptime
}

function print_disk_usage()
{
        df -h | sort -hrk5 | head -5  
}

function print_memory_usage()
{
        command free -h 
}

function print_process()
{
        ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6
}

function main()
{
        print_header "hostname and os"
        print_hostname

        print_header " uptime"
        print_uptime

        print_header "Disk Usage"
        print_disk_usage

        print_header "memory usage"
        print_memory_usage

        print_header " Top 5 CPU consuming process" 
        print_process
}

main

```

## Sample Output

```text

==========================================================
                hostname and os
==========================================================
  Static hostname: ip-172-31-33-134
        Icon name: computer-vm
          Chassis: vm 🖴
Chassis Asset Tag: Amazon EC2
       Machine ID: ec281626224a4de76d78f49da096d76b
          Boot ID: d3e4f4240b964e65ba350b9593ba4cfd
   Virtualization: amazon
 Operating System: Ubuntu 26.04.1 LTS
           Kernel: Linux 7.0.0-1014-aws
     Architecture: x86-64

==========================================================
                 uptime
==========================================================
 13:46:56 up  4:47,  2 users,  load average: 0.00, 0.00, 0.00

==========================================================
                Disk Usage
==========================================================
/dev/root         11G  3.1G  7.4G  30% /
/dev/nvme0n1p13  989M  163M  759M  18% /boot
/dev/nvme0n1p15  105M  6.3M   99M   7% /boot/efi
efivarfs         128K  3.3K  120K   3% /sys/firmware/efi/efivars
tmpfs            182M  908K  181M   1% /run

==========================================================
                memory usage
==========================================================
               total        used        free      shared  buff/cache   available
Mem:           908Mi       332Mi       214Mi       2.7Mi       472Mi       576Mi
Swap:             0B          0B          0B

==========================================================
                 Top 5 CPU consuming process
==========================================================
    PID    PPID CMD                         %MEM %CPU
   5085       1 /usr/lib/systemd/systemd-ho  0.8 62.5
   4767    4709 sshd-session: ubuntu@pts/0   0.8  0.0
    667       1 /snap/snapd/current/usr/lib  4.6  0.0
   4768    4767 -bash                        0.6  0.0
      1       0 /sbin/init                   1.7  0.0

```

## Explanation

The script uses separate functions for:

* System information
* Uptime
* Disk usage
* Memory usage
* CPU usage

A `main()` function controls the flow of execution, making the script easier to maintain and extend.

---

# Key Learnings

## 1. Functions Improve Reusability

Functions allow code to be reused multiple times without duplication.

## 2. Strict Mode Prevents Hidden Errors

Using:

```bash
set -euo pipefail
```

helps catch failures early and makes scripts more reliable.

## 3. Local Variables Keep Functions Isolated

Using `local` prevents variables from leaking outside a function and causing unexpected behavior.

---

# Conclusion
Day 18 was all about writing better Bash scripts and understanding how they’re used in real-world DevOps tasks. I learned how functions, strict mode, and local variables help make scripts cleaner, safer, and easier to maintain. 



