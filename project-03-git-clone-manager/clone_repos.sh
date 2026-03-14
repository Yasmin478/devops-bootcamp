#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
BASE_DIR="$SCRIPT_DIR/repos"
LOG_FILE="$BASE_DIR/clone.log"

mkdir -p "$BASE_DIR"

command -v git >/dev/null 2>&1 || { echo "Error: git is not installed."; exit 1; }  

CLONED=0
SKIPPED=0
FAILED=0

log(){
    echo "$(date '+%Y-%m-%d  %H:%M:%S') - $*" | tee -a "$LOG_FILE"  
}

REPOS=(
    "https://github.com/octocat/Hello-World.git"
    "https://github.com/github/gitignore.git"
    "https://github.com/githubtraining/hellogitworld.git"
)

for repo in "${REPOS[@]}"; do
    repo_name=$(basename "$repo" .git)
    repo_path="$BASE_DIR/$repo_name"

    if [ -d "$repo_path" ]; then
        log "Repository $repo_name already exists at $repo_path. Skipping clone."
        ((SKIPPED+=1))
    else
        log "Cloning $repo_name"
        echo ""

        if git clone "$repo" "$repo_path"; then
            echo ""
            log "Successfully cloned $repo_name"
            ((CLONED+=1))
            echo ""
        else
            log "Failed to clone $repo_name"
            ((FAILED+=1))
            echo ""
        fi
    fi
done

log "Cloning summary: $CLONED cloned, $SKIPPED skipped, $FAILED failed."