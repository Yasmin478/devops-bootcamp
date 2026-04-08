# Project 06: Backup Automation System

## Description

A production-style Bash script to automate directory backups with compression, logging, retention policy, and scheduling support.

This project demonstrates real-world DevOps practices such as automation, observability, and configuration-driven scripting.

---

## Features

* Backup any directory
* Compression using `tar.gz`
* Timestamp-based backup naming (prevents overwrite)
* Logging system with levels (`INFO`, `ERROR`)
* Retention policy (automatically deletes old backups)
* Config file support (`config.conf`)
* Portable paths using `SCRIPT_DIR`
* Cron-based automation support

---

## Tech Stack

* Bash Scripting
* Linux Commands (`tar`, `ls`, `rm`, `cron`)
* File System Management

---

## Project Structure

```
project-06-backup-automation/
│
├── backup.sh
├── config.conf
├── backups/
├── logs/
└── README.md
```

---

## Configuration

Edit the `config.conf` file:

```
MAX_BACKUPS=3
```

* `MAX_BACKUPS` → Number of latest backups to retain
* Older backups are automatically deleted

---

## Usage

```
./backup.sh <directory_to_backup>
```

---

## Example

```
./backup.sh ~/test_backup
```

---

## How It Works

1. Validates input directory
2. Creates a compressed archive using `tar`
3. Stores backup with timestamp
4. Logs all operations
5. Applies retention policy to delete old backups

---

## Logging

Logs are stored in:

```
logs/backup.log
```

Example:

```
[2026-04-04 14:00:00] [INFO] Starting backup
[2026-04-04 14:00:01] [INFO] Backup created successfully
[2026-04-04 14:00:02] [INFO] Deleted old backup
```

---

## Retention Policy

* Keeps only the latest `N` backups
* Automatically deletes older backups

Example:

If `MAX_BACKUPS=3` → only latest 3 backups are retained

---

## Automation with Cron

### 🔹 Open crontab

```
crontab -e
```

---

### 🔹 Add a job (Daily at 2 AM)

```
0 2 * * * /full/path/to/backup.sh /full/path/to/source_directory
```

---

### 🔹 Example

```
0 2 * * * /home/yasmin/Projects/devops-bootcamp/project-06-backup-automation/backup.sh /home/yasmin/test_backup
```

---

### 🔹 For Testing (Every 5 minutes)

```
*/5 * * * * /full/path/to/backup.sh /full/path/to/source_directory
```

---

### Notes

* Always use absolute paths in cron
* Ensure script is executable:

```
chmod +x backup.sh
```

---

## Verification

Check cron jobs:

```
crontab -l
```

Check logs:

```
cat logs/backup.log
```

---

## Key Learnings

* Bash scripting (advanced concepts)
* Logging and observability
* File handling and automation
* Safe scripting practices (`set -euo pipefail`)
* Retention strategies (real-world use case)
* Cron job scheduling
* Config-driven design

---

## Future Improvements

* Add email alerts for failures
* Add backup encryption
* Add remote backup (e.g., AWS S3)
* Add restore functionality

---

## Author

**Yasmin Ara Islam**

DevOps Bootcamp Project