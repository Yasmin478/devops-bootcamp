# Project 3: Git Clone Automation Script

## Overview

This project contains a Bash script that automates cloning multiple Git repositories.
The script checks if repositories already exist before cloning and logs all operations.

This project demonstrates practical Bash scripting skills commonly used in DevOps workflows.

---

## Features

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
├── repos/
│   ├── Hello-World/
│   ├── gitignore/
│   └── hellogitworld/
│
└── clone.log
```

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

Possible enhancements:

* Accept repository URLs from a file
* Add parallel cloning
* Add error handling improvements
* Add command-line arguments

---

## Author

Yasmin

Created as part of a DevOps learning path focused on Bash automation and Git workflow.

