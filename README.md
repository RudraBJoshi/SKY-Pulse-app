# SKY-Pulse-app

This repository contains multiple sub-projects:
- **SKY-Pulse** - Frontend application
- **SKY-backend** - Backend API

## Setup

### 1. Clone the repositories

```bash
mkdir SKY-Pulse-app && cd SKY-Pulse-app
git clone <SKY-Pulse-repo-url>
git clone <SKY-backend-repo-url>
```

### 2. Set up `git pull-all` command

This allows you to pull all repositories at once with `git pull-all`.

**Create the script:**

```bash
cat > pull-all.sh << 'EOF'
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
EOF
chmod +x pull-all.sh
```

**Add the git alias:**

Edit your `~/.gitconfig` and add:

```ini
[alias]
    pull-all = !bash /path/to/SKY-Pulse-app/pull-all.sh
```

Replace `/path/to/SKY-Pulse-app` with your actual path.

### 3. Usage

From anywhere, run:

```bash
git pull-all
```

This will pull the latest changes for all repositories in the SKY-Pulse-app directory.
