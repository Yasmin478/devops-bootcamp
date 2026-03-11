#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
BASE_DIR="$SCRIPT_DIR/repos"
LOG_FILE="$BASE_DIR/clone.log"
mkdir -p "$BASE_DIR"

log(){
    echo "$(date '+%Y-%m-%d  %H:%M:%S') - $*" | tee -a "$LOG_FILE"  
}

REPOS=(
    "https://github.com/octocat/Hello-World.git"
    "https://github.com/github/gitignore.git"
    "https://github.com/githubtraining/hellogitworld.git"
)

for repos in "${REPOS[@]}"; do
    repo_name=$(basename "$repos" .git)
    repo_path="$BASE_DIR/$repo_name"

    if [ -d "$repo_path" ]; then
        log "Repository $repo_name already exists at $repo_path. Skipping clone."
    else
        log "Cloning $repo_name"
        echo ""

        if git clone "$repos" "$repo_path"; then
            echo ""
            log "Successfully cloned $repo_name"
            echo ""
        else
            log "Failed to clone $repo_name"
            echo ""
        fi
    fi
done