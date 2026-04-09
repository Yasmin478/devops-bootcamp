# Project 06: Backup Automation System

## Overview

A production-ready Bash automation script p to automate directory backups with compression, logging, retention policy, and scheduling support.

This project demonstrates real-world DevOps practices such as automation, observability, and configuration-driven scripting.

---

## Features

- Backup any directory
- Compression using `tar.gz`
- Timestamp-based backup naming (prevents overwrite)
- Logging system with levels (`INFO`, `ERROR`)
- Retention policy (automatically deletes old backups)
- Config file support (`config.conf`)
- Portable paths using `SCRIPT_DIR`
- Cron-based automation support

---

## Tech Stack

- Bash Scripting
- Linux Commands (`tar`, `ls`, `rm`, `cron`)
- File System Management

---

## Project Structure

```
project-06-backup-automation/
│
├── backup.sh
├── config.conf
├── backups/
│   └── *.tar.gz
├── logs/
│   └── backup.log
└── README.md
```

---

## Why This Project Matters

This project simulates real-world backup automation used in production systems.

It demonstrates:
- Data protection strategies
- Automated maintenance (retention policy)
- Observability through logging
- Cron-based scheduling for reliability
- Idempotent behavior by avoiding duplicate or overwritten backups

---

## Configuration

Edit the `config.conf` file:

```
BACKUP_DIR=/path/to/backups
LOG_DIR=/path/to/logs
LOG_FILE=$LOG_DIR/backup.log
MAX_BACKUPS=3
```

- `BACKUP_DIR` → where backups are stored  
- `LOG_DIR` → directory for logs  
- `LOG_FILE` → log file path  
- `MAX_BACKUPS` → number of backups to retain

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
6. Ensures only the latest backups are retained based on configuration
---

## Error Handling

- Uses strict mode (`set -euo pipefail`) for safe execution
- Validates input directory
- Handles missing configuration
- Logs all failures with ERROR level

---

## Logging

- Structured logging with timestamps and levels (`INFO`, `ERROR`)
- Logs written to both console and file

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

- Backups are sorted by newest first
- Only the latest `N` backups are retained
- Older backups are automatically deleted

Example:

If `MAX_BACKUPS=3` → only latest 3 backups are retained

---

## Exit Codes

- `0` → Success  
- `1` → General error (invalid input, config missing)

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