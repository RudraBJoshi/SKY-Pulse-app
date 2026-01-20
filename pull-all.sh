#!/bin/bash
# Pull all git repositories in the current directory

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for dir in "$SCRIPT_DIR"/*/; do
    if [ -d "$dir/.git" ]; then
        repo_name=$(basename "$dir")
        echo "Pulling $repo_name..."
        git -C "$dir" pull
        echo ""
    fi
done

echo "Done pulling all repositories."
