# Service Manager Script

A Bash automation script to manage Linux services using systemd.
This script allows starting, stopping, restarting, and checking the status of services from the command line with flexible input handling.

## Features

- Manage services using systemctl
- Supports actions:

  - start
  - stop
  - restart
  - status

- Accepts arguments in **both formats**:

  - `service action`
  - `action service`

- Case-insensitive input**

  - `NGINX`, `nginx`, `Nginx` all work

- Built-in **usage help and argument validation**
- Handles incorrect inputs gracefully

## Requirements

- Linux system with **systemd**
- Bash shell

## Usage

```
./service-manager.sh <service> <action>
```

or

```
./service-manager.sh <action> <service>
```

## Available Actions

- start
- stop
- restart
- status

## Examples

Start nginx

```
./service-manager.sh nginx start
```

Stop nginx

```
./service-manager.sh stop nginx
```

Restart ssh service

```
./service-manager.sh ssh restart
```

Check service status

```
./service-manager.sh status nginx
```

## Error Handling

The script checks for:

- Missing arguments
- Invalid service names
- Invalid commands

If an invalid command is used, it prints a helpful usage message.

## Project Purpose

This project was built as part of learning **Linux automation and DevOps scripting**, focusing on:

- Bash scripting
- Argument parsing
- Input validation
- System service management

## Future Improvements

- Auto-detect available services
- Add logging for service actions
- Add batch service management
- Integrate with monitoring scripts

## License

Open for learning and experimentation.
