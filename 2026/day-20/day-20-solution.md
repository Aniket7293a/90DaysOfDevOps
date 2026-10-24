# Day 20 - Log Analyzer and Report Generator

## Objective

This challenge focused on building a Bash-based log analyzer that validates a log file, detects errors and critical events, identifies common error messages, and generates a daily summary report.

---

## Features Implemented

### Task 1: Input Validation

- Accepts a log file path as a command-line argument.
- Displays an error if no argument is provided.
- Displays an error if the file does not exist.

Example:

```bash
./log_analyzer.sh demo.log
```

---

### Task 2: Error Count

The script counts all log entries containing:

- error
- failed

Command used:

```bash
grep -Ei "error|failed" "$LOG_FILE" | wc -l
```

Example Output:

```text
Total Errors Found: 137
```

Explaination:

```text
-E = Enables extended regex so | means OR
-i = ignores case (upper/lower)
```

---

### Task 3: Critical Events

The script searches for CRITICAL events and displays their line numbers along with the complete log entry.

```text
critical
```

Command used:

```bash
grep -n "CRITICAL" "$log_file" | while IFS=: read -r line_num line_entry
do
        echo " Line $line_num: $line_entry "
done
```

---

### Task 4: Top 5 Error Messages

The script extracts the most common error messages and displays them in descending order.

Command used:

```bash
$(grep -i "error" "$log_file" | sort | uniq -c | sort -nr | head -5)
```

Example Output:

```text
                 ===== Top 5 error Message ======
      1 2026-10-23 18:56:28 [ERROR] Segmentation fault - 4306
      1 2026-10-23 18:56:28 [ERROR] Segmentation fault - 276
      1 2026-10-23 18:56:28 [ERROR] Segmentation fault - 2743
      1 2026-10-23 18:56:28 [ERROR] Segmentation fault - 25049
      1 2026-10-23 18:56:28 [ERROR] Segmentation fault - 18604

```

---

### Task 5: Summary Report

The script automatically generates:

```text
log_report_<date>.txt
```

Example:

```text
log_report_26-10-24.txt
```

The report contains:

- Date of analysis
- Log file name
- Total lines processed
- Total error count
- Top 5 error messages
- Critical events

---

### Task 6: Archive Processed Logs

The script automatically creates an archive directory if it does not exist:

```bash
mkdir -p archive
```

After analysis, the processed log file is moved:

```bash
mv "$LOGFILE" archive/
```

Example:

```text
Log file moved to archive/
```

---

## Commands and Tools Used

### grep

Searches for matching patterns.

```bash
grep "ERROR" logfile.log
```

### grep -i

Performs a case-insensitive search.

```bash
grep -i "failed" logfile.log
```

### grep -n

Displays line numbers.

```bash
grep -n "critical" logfile.log
```

### wc -l

Counts lines.

```bash
wc -l
```

### awk

Extracts specific fields from text.

```bash
awk -F': ' '{print $NF}'
```

### sort

Sorts output alphabetically.

```bash
sort
```

### uniq -c

Counts duplicate entries.

```bash
uniq -c
```

### head

Displays top results.

```bash
head -5
```

### mkdir -p

Creates a directory if it doesn't already exist.

```bash
mkdir -p archive
```

### mv

Moves files.

```bash
mv logfile archive/
```

---

## Sample Output

```text
======= LOG ANALYSIS REPORT ======

 Date of analysis  : Sat Oct 24 18:50:40 UTC 2026
 Log file name     : ./tmp/test.log
 Total lines processed : 100
 Total error count : 21

 ===== Top 5 error Message ======
      1 2026-10-23 18:56:28 [ERROR] Segmentation fault - 4306
      1 2026-10-23 18:56:28 [ERROR] Segmentation fault - 276
      1 2026-10-23 18:56:28 [ERROR] Segmentation fault - 2743
      1 2026-10-23 18:56:28 [ERROR] Segmentation fault - 25049
      1 2026-10-23 18:56:28 [ERROR] Segmentation fault - 18604

 ====== Critical Events ======
 Line 1: 2026-10-23 18:56:28 [CRITICAL]  - 26629
 Line 2: 2026-10-23 18:56:28 [CRITICAL]  - 7575
 Line 7: 2026-10-23 18:56:28 [CRITICAL]  - 18938
 Line 14: 2026-10-23 18:56:28 [CRITICAL]  - 8169
 Line 17: 2026-10-23 18:56:28 [CRITICAL]  - 21441

```

---

## Challenges Faced

1. Some log entries contained non-printable characters, causing grep to treat the file as binary.
2. The Linux log dataset contained lowercase error messages instead of uppercase ERROR.
3. Critical events were not present in the dataset, so additional handling was added.
4.  Understanding new command that i have not used before..

---

## What I Learned

### 1. Log Analysis with grep

I learned how to search and filter log files using grep with different options such as:

```bash
grep -Ei
```

---

### 2. Data Processing Pipelines

I learned how to combine multiple Linux commands:

```bash
grep | awk | sort | uniq | head -5
```

to extract meaningful information from large log files.

---

### 3. Automating Administrative Tasks

I learned how to automate:

- Log analysis
- Report generation
- File archiving

using a Bash script.

---

## Conclusion

By completing Day 20, I built a Bash-based **Log Analyzer and Report Generator** that can take a log file, analyze important events, generate useful statistics, create a daily report, and optionally archive the processed log.

This was a practical step toward automating common **Linux system administration and DevOps tasks**.

**Day 20 completed ✅**
