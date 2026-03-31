# Project 02: Service Manager Script

## Overview

A Bash automation script to manage Linux services using systemd.

This script allows starting, stopping, restarting, and checking the status of services from the command line with flexible input handling.

---

## Features
- Manage services using systemctl
- Supports actions: <start|stop|restart|status>
- Accepts arguments in **both formats**: `service action`,  `action service`
- Case-insensitive input**  `NGINX`, `nginx`, `Nginx` all work
- Built-in **usage help and argument validation**
- Handles incorrect inputs gracefully
- Built-in logging system
  - Logs all actions to a file with timestamps
- Automatic log directory creation
- Service existence validation using systemctl
- Uses sudo for service management operations
- Returns meaningful exit codes for automation

---

## Logging
- Logs are stored at:
        ~/Projects/devops-bootcamp/project-02-service-manager/logs/service.log
- Each action is recorded with timestamp:
- Service start/stop/restart/status
- Errors (invalid service, failures)

---

## Requirements
- Linux system with **systemd**
- Bash shell

---

## Usage
```
./service-manager.sh <service> <action>
```
or

```
./service-manager.sh <action> <service>
```
---

## Exit Codes
- 0 → Success
- 1 → Invalid arguments
- 2 → Service not found

---

## Available Actions
- start
- stop
- restart
- status

---

## Examples
- Start nginx

```
./service-manager.sh nginx start
```

- Stop nginx

```
./service-manager.sh stop nginx
```

- Restart ssh service

```
./service-manager.sh ssh restart
```

- Check service status

```
./service-manager.sh status nginx
```
---

## Error Handling
The script checks for:

- Missing arguments
- Invalid commands (not start/stop/restart/status)
- Non-existent services (validated via systemctl)

If an invalid command is used, it prints a helpful usage message.

---

## Project Purpose
This project was built as part of learning **Linux automation and DevOps scripting**, focusing on:

- Bash scripting
- Argument parsing
- Input validation
- System service management

---

## Future Improvements
- Add log rotation
- Add email/Slack alerts
- Add bulk service management
- Integrate with monitoring tools

---

## License

Open for learning and experimentation.

---

## Author

Yasmin Ara Islam
DevOps Bootcamp Project