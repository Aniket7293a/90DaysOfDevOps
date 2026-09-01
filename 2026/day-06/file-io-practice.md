# 🚀 Day 06 – Linux File Operations

## What I practiced today

Today I practiced some basic Linux commands for creating files, adding content, reading files, and managing them from the terminal.

### 1. Create and write a file

```bash
touch notes.txt

echo "Line 1" > notes.txt
echo "Line 2" >> notes.txt
echo "Line 3" | tee -a notes.txt
```

`touch` creates the file.
`>` writes content and replaces old content.
`>>` adds content to the existing file.
`tee -a` shows the output and appends it to the file.

### 2. Read the file

```bash
cat notes.txt
head -n 2 notes.txt
tail -n 2 notes.txt
```

I used `cat` to see the full file, while `head` and `tail` helped me check only the beginning or end.

### 3. Manage files

```bash
ls
cp notes.txt backup.txt
mv backup.txt old-notes.txt
rm old-notes.txt
```

These commands helped me practice listing, copying, renaming, and removing files.

### 4. Search and permissions

```bash
grep "Line" notes.txt
wc notes.txt
chmod +x notes.txt
```

`grep` searches for specific text, `wc` counts file content, and `chmod` is used to change file permissions.

## 🎯 My takeaway

Most of these commands are small, but they are used a lot when working with Linux servers. Practicing them directly in the terminal made them much easier to understand.

**Day 06/90 ✅ 🐧**


