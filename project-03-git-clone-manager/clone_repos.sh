#!/bin/bash

# Directory where the repositories will be stored
BASE_DIR="$HOME/devops-bootcamp/project-03-git-clone-manager/repos"

# Log file to keep track of cloned repositories
LOG_FILE="$BASE_DIR/clone.log"

mkdir -p "$BASE_DIR"

# List of repositories
REPOS=(
    "https://github.com/octocat/Hello-World.git"
    "https://github.com/github/gitignore.git"
    "https://github.com/githubtraining/hellogitworld.git"
)   

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}       

for repo in "${REPOS[@]}"; do
    repo_name=$(basename "$repo" .git)
    repo_path="$BASE_DIR/$repo_name"

    if [ -d "$repo_path" ]; then
        log_message "Repository '$repo_name' already exists. Skipping clone."
        echo "Repository '$repo_name' already exists. Skipping clone."
    else
        log_message "Cloning '$repo_name'..."
        echo "Cloning '$repo_name'..."
       
        if  git clone "$repo" "$repo_path"; then
            log_message "Successfully cloned '$repo_name'."
            echo "Successfully cloned '$repo_name'."
            echo ""
        else
            log_message "Failed to clone '$repo_name'."
            echo "Failed to clone '$repo_name'."
            echo ""
        fi
    fi
done