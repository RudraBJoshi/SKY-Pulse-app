# SKY-Pulse-app

Volunteer hours tracking system for the Art of Living SKY Teens Organization.

## Projects

| Directory | Description |
|-----------|-------------|
| [SKY-Pulse/](SKY-Pulse/) | Jekyll frontend (GitHub Pages) |
| [SKY-backend/](SKY-backend/) | Flask REST API (Vercel) |

## Quick Start

```bash
# Clone this repo (includes pull-all script)
git clone <this-repo-url>
cd SKY-Pulse-app

# Clone sub-repositories
git clone <SKY-Pulse-repo-url>
git clone <SKY-backend-repo-url>

# Pull all repos at once
git pull-all
```

## Setup `git pull-all`

Create the git alias to pull all repositories at once:

**1. The script is already included:** `pull-all.sh`

**2. Add the git alias** - Edit `~/.gitconfig`:

```ini
[alias]
    pull-all = !bash /path/to/SKY-Pulse-app/pull-all.sh
```

Replace `/path/to/SKY-Pulse-app` with your actual path.

**3. Usage:**

```bash
git pull-all
```

---

## Frontend (SKY-Pulse)

Jekyll static site hosted on GitHub Pages.

### Tech Stack
- Jekyll (Static Site Generator)
- GitHub Pages Cayman theme
- HTML, CSS, JavaScript

### Prerequisites
- Ruby (with Bundler)
- Python 3.x
- Make

### Installation

```bash
cd SKY-Pulse
bundle install
pip install -r requirements.txt
```

### Run Development Server

```bash
make PORT=4600
```

Visit `http://localhost:4600`

### Commands

| Command | Description |
|---------|-------------|
| `make` | Start server |
| `make stop` | Stop server |
| `make reload` | Restart server |
| `make clean` | Remove generated files |

### Structure

```
SKY-Pulse/
├── _notebooks/       # Jupyter notebooks
├── assets/js/        # JavaScript (auth, tracker)
├── hacks/
│   ├── hours-tracker.md   # Admin dashboard
│   └── student-view.md    # Student portal
├── _config.yml       # Jekyll config
├── Gemfile           # Ruby dependencies
└── Makefile          # Build automation
```

---

## Backend (SKY-backend)

Flask REST API deployed on Vercel with Turso database.

### Tech Stack
- Flask 3.0.0
- Turso (LibSQL - serverless SQLite)
- Vercel (serverless functions)

### Prerequisites
- Python 3.x
- Turso account
- Vercel account (for deployment)

### Installation

```bash
cd SKY-backend
python -m venv venv
source venv/bin/activate
pip install -r api/requirements.txt
```

### Environment Variables

Create `.env`:

```
TURSO_DATABASE_URL=libsql://your-database.turso.io
TURSO_AUTH_TOKEN=your-auth-token
ADMIN_USERNAME=admin
ADMIN_PASSWORD_HASH=<sha256-hash>
SECRET_KEY=your-secret-key
```

### Run Locally

```bash
python api/index.py
```

Server runs on `http://localhost:5000`

### API Endpoints

| Method | Endpoint | Auth | Description |
|--------|----------|------|-------------|
| POST | `/api/auth/login` | No | Admin login |
| GET | `/api/students` | Yes | List students |
| POST | `/api/students` | Yes | Create student |
| GET | `/api/events` | Yes | List events |
| POST | `/api/events` | Yes | Create event |
| POST | `/api/public/student` | No | Student lookup |
| GET | `/api/health` | No | Health check |

### Deploy to Vercel

```bash
npm i -g vercel
vercel
```

### Structure

```
SKY-backend/
├── api/
│   ├── index.py           # Flask app
│   └── requirements.txt   # Dependencies
├── .env                   # Environment variables
└── vercel.json            # Vercel config
```

---

## Features

- **Hours Tracking** - Track volunteer hours (1 session = 0.5 hours)
- **Events System** - Create events with bonus hours
- **Student Portal** - Students can view their own hours
- **Admin Dashboard** - Manage students and events
- **Data Export/Import** - JSON backup and restore
- **Token Auth** - 8-hour session tokens
