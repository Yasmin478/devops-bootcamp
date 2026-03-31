# Project 3: Git Clone Automation Script

## Overview

This project contains a Bash script that automates cloning multiple Git repositories.
The script checks if repositories already exist before cloning and logs all operations.

This project demonstrates practical Bash scripting skills commonly used in DevOps workflows.

---

## Features

* Uses strict Bash mode (`set -euo pipefail`) for safer execution
* Logs output to both terminal and file using tee
* Provides cloning summary (`cloned`, `skipped`, `failed`)
* Validates Git installation before execution
* Portable script (runs from any directory)
* Clone multiple repositories automatically
* Skip repositories that already exist
* Log cloning activity with timestamps
* Store repositories in a structured directory
* Simple and reusable Bash automation

---

## Project Structure

```
project-03-git-clone-manager/
│
├── clone_repos.sh
└── repos/
    ├── Hello-World/
    ├── gitignore/
    ├── hellogitworld/
    └── clone.log
```

---

## Logging

Logs are stored at:
    -  `repos/clone.log`
- Includes timestamps for all actions
- Logs both successful and failed operations
- Output is displayed in terminal and saved to file

---

## Error Handling

The script handles:

- Missing Git installation
- Clone failures
- Existing repositories
- Script failures using strict mode (`set -euo pipefail`)

---

## Requirements

* Linux system
* Bash shell
* Git installed

Check Git installation:

```
git --version
```

---

## Usage

Make the script executable:

```
chmod +x clone_repos.sh
```

Run the script:

```
./clone_repos.sh
```

---

## How It Works

1. Creates a directory to store repositories.
2. Iterates through a list of repository URLs.
3. Extracts the repository name from the URL.
4. Checks if the repository directory already exists.
5. Clones the repository if it is not present.
6. Logs the operation with timestamps.

---

## Example Output

```
Cloning 'Hello-World'...

Successfully cloned 'Hello-World'.

Repository 'gitignore' already exists. Skipping clone.

Cloning summary: 2 cloned, 1 skipped, 0 failed.

```

---

## Learning Objectives

This project demonstrates:

* Bash arrays
* For loops
* Functions
* Logging
* Git automation
* Directory validation
* Exit status checking

These are common scripting techniques used in DevOps environments.

---

## Future Improvements

* Accept repository URLs from external file (config-driven)
* Add parallel cloning for faster execution
* Add retry mechanism for failed clones
* Add CLI arguments support
* Integrate with CI/CD pipelines

---

## Author

**Yasmin Ara Islam**

Created as part of a DevOps learning path focused on Bash automation and Git workflow.