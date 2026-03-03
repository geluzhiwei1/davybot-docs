Installation - DaweiBot (English)
## Keyboard shortcuts

Press←or→to navigate between chapters

PressSor/to search in the book

Press?to show this help

PressEscto hide this help

- Auto
- Light
- Rust
- Coal
- Navy
- Ayu# DaweiBot (English)
[../print.html]()
# [#installation](Installation)

## [#system-requirements](System Requirements)

Before installing DavyBot, make sure your system meets the following requirements:

- **Operating System**: Linux, macOS, or Windows
- **Python**: Python 3.12 or higher
- **Node.js**: Node.js 20.19+ or 22.12+ (for Web UI)
- **Rust**: For mdBook documentation generation (optional)
- **Memory**: At least 4GB RAM
- **Disk Space**: At least 1GB free space
## [#installation-methods](Installation Methods)

### [#method-1-using-uv-recommended](Method 1: Using UV (Recommended))

UV is a fast Python package manager.

```
`# Install UV
pip install uv

# Install DavyBot using UV
cd dawei-agent
uv pip install -e .`
```

### [#method-2-using-pip](Method 2: Using PIP)

```
`# Navigate to backend directory
cd dawei-agent

# Install dependencies
pip install -e .`
```

### [#method-3-using-docker](Method 3: Using Docker)

```
`# Pull Docker image
docker pull davybot/latest

# Run container
docker run -d -p 8465:8465 davybot/latest`
```

## [#configuration](Configuration)

### [#1-environment-variables](1. Environment Variables)

Create a`.env`file in the`agent/`directory:

```
`cd agent
cp .env.example .env`
```

Edit the`.env`file with your configuration:

```
`# LLM API Configuration
LITELLM_API_KEY=your_api_key_here
LITELLM_MODEL=deepseek/deepseek-chat

# Or use OpenAI
OPENAI_API_KEY=your_openai_key_here

# Server Configuration
HOST=0.0.0.0
PORT=8465

# Workspace Configuration
WORKSPACES_ROOT=./workspaces

# Security Configuration
JWT_SECRET=your_jwt_secret_here
ENCRYPTION_KEY=your_32_character_encryption_key_here`
```

### [#2-frontend-configuration](2. Frontend Configuration)

```
`cd webui

# Install dependencies
pnpm install

# Or using npm
npm install`
```

## [#verification](Verification)

### [#1-check-backend](1. Check Backend)

```
`# Verify DavyBot command is available
dawei --version

# Or
dawei --help`
```

### [#2-start-backend-server](2. Start Backend Server)

```
`# Method 1: Foreground
dawei server start

# Method 2: Background (daemon)
dawei server start --daemon

# Method 3: Direct with uvicorn
cd agent
uv run uvicorn dawei.server:app --host 0.0.0.0 --port 8465`
```

### [#3-start-frontend-development-server](3. Start Frontend Development Server)

```
`cd webui

# Development mode
pnpm dev

# Or
npm run dev`
```

### [#4-access-web-ui](4. Access Web UI)

Open your browser and visit:

- **Frontend**: http://localhost:8460
- **Backend API**: http://localhost:8465
- **API Documentation**: http://localhost:8465/docs
## [#quick-test](Quick Test)

### [#using-command-line](Using Command Line)

```
`# Start TUI (Text User Interface)
dawei tui --workspace ./my-workspace

# Or run Agent directly
dawei agent run ./my-workspace "Help me write a quick sort algorithm"`
```

### [#using-web-ui](Using Web UI)

- Open http://localhost:8460
- Create a workspace
- Start chatting
## [#common-issues](Common Issues)

### [#issue-1-python-version-incompatible](Issue 1: Python Version Incompatible)

**Error**:`Python version too old`

**Solution**:

```
`# Check Python version
python --version

# Install Python 3.12 using pyenv
pyenv install 3.12.0
pyenv local 3.12.0`
```

### [#issue-2-port-already-in-use](Issue 2: Port Already in Use)

**Error**:`Address already in use`

**Solution**:

```
`# Find process using the port
lsof -i :8465

# Kill the process
kill -9 <PID>

# Or use a different port
dawei server start --port 8466`
```

### [#issue-3-dependency-installation-failed](Issue 3: Dependency Installation Failed)

**Solution**:

```
`# Upgrade pip
pip install --upgrade pip

# Use domestic mirror (China)
pip install -e . -i https://pypi.tuna.tsinghua.edu.cn/simple`
```

### [#issue-4-frontend-failed-to-start](Issue 4: Frontend Failed to Start)

**Solution**:

```
`# Clean node_modules
cd webui
rm -rf node_modules pnpm-lock.yaml
pnpm install

# Or using npm
rm -rf node_modules package-lock.json
npm install`
```

## [#next-steps](Next Steps)

After installation, you can:

- **Read User Guides**: Learn how to use skills and plugins
- **Configure AI Model**: Set up your preferred LLM provider
- **Create Workspace**: Start your first AI task
- **Explore TUI**: Experience the command-line interface
## [#getting-help](Getting Help)

If you encounter problems:

- Check[../troubleshooting.html](Troubleshooting Documentation)
- Visit[https://github.com/your-org/davybot/issues](GitHub Issues)
- Join community discussions
## [#updates](Updates)

### [#update-to-latest-version](Update to Latest Version)

```
`# Pull latest code
git pull origin main

# Update backend dependencies
cd agent
uv pip install -e .

# Update frontend dependencies
cd ../webui
pnpm install`
```

### [#check-current-version](Check Current Version)

```
`dawei --version`
```

## [#uninstallation](Uninstallation)

```
`# Uninstall Python package
cd agent
pip uninstall dawei-server

# Remove configuration and data
rm -rf ~/.dawei
rm -rf ./workspaces`
```
[../user/skills/work-with-skills.html]()[../user/skills/work-with-skills.html]()