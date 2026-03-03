Instant Messaging Plugins - DaweiBot (English)
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
[../../print.html]()
# [#instant-messaging-plugins](Instant Messaging Plugins)

DavyBot supports plugins for various instant messaging (IM) platforms, allowing you to interact with the AI assistant in your favorite chat applications.

## [#supported-platforms](Supported Platforms)

- **Feishu/Lark**- Enterprise collaboration platform
- **WeChat**- Instant messaging tool
- **DingTalk**- Enterprise communication platform
- **Slack**- Team collaboration tool
- **Telegram**- Instant messaging software
## [#plugin-features](Plugin Features)

- **Two-way Conversations**: Interact directly with AI in chat apps
- **Skill Invocation**: Use @ syntax to invoke specific skills
- **Workspace Management**: Create separate conversations for different projects
- **File Processing**: Support file uploads and processing
- **Real-time Notifications**: Receive task completion notifications
## [#installation-and-setup](Installation and Setup)

Using Feishu as an example to demonstrate plugin installation and configuration.

### [#method-1-manual-installation](Method 1: Manual Installation)

Copy the plugin directly to your workspace’s plugin directory:

```
`your-workspace/
└── .dawei/
    └── plugins/
        └── feishu/
            ├── __init__.py
            ├── config.json
            └── handler.py`
```

**Plugin Directory Structure**:

```
`feishu-plugin/
├── manifest.json          # Plugin manifest
├── handler.py             # Message handler
├── config.yaml            # Configuration file
└── README.md              # Documentation`
```

### [#method-2-plugin-market-installation](Method 2: Plugin Market Installation)

- Visit the DavyBot Plugin Market
- Browse available plugins
- Click “Install” button
- Follow the configuration guide
### [#method-3-install-from-github](Method 3: Install from GitHub)

```
`# Clone plugin repository
git clone https://github.com/your-org/feishu-plugin.git

# Copy to workspace
cp -r feishu-plugin/* your-workspace/.dawei/plugins/feishu/`
```

## [#configuration](Configuration)

### [#1-basic-configuration](1. Basic Configuration)

Edit the plugin’s configuration file (usually`config.yaml`or`config.json`):

```
`# Feishu plugin configuration
plugin:
  name: feishu
  version: "1.0.0"
  enabled: true

# Application credentials
credentials:
  app_id: "cli_xxxxxxxxxxxxx"
  app_secret: "your_app_secret_here"
  encrypt_key: "your_encrypt_key"
  verification_token: "your_verification_token"

# Event subscriptions
events:
  - message: ReceiveMessage
  - bot: BotMenu`
```

### [#2-get-feishu-application-credentials](2. Get Feishu Application Credentials)

- Visit[https://open.feishu.cn/](Feishu Open Platform)
- Create an enterprise app
- Obtain the following information:

- App ID
- App Secret
- Encrypt Key
- Verification Token
### [#3-configure-event-subscriptions](3. Configure Event Subscriptions)

Configure event subscriptions in Feishu Open Platform:

- **Request URL**:`https://your-domain.com/api/webhooks/feishu`
- **Message Events**:`im.message.receive_v1`
- **Bot Menu**:`application.bot.menu_v1`
## [#plugin-management](Plugin Management)

### [#view-installed-plugins](View Installed Plugins)

```
`# Use CLI to view plugins
dawei plugins list

# View in Web UI
Visit: http://localhost:8460/plugins`
```

**Plugin List Interface**:

### [#enabledisable-plugins](Enable/Disable Plugins)

```
`# Enable plugin
dawei plugins enable feishu

# Disable plugin
dawei plugins disable feishu`
```

### [#plugin-configuration](Plugin Configuration)

Configure plugin parameters in Web UI:

**Configuration Items**:

- **Enabled Status**: Control whether plugin is enabled
- **Auto Reply**: Whether to auto-respond to messages
- **Skill Filter**: Specify available skill list
- **Notification Settings**: Configure notification methods
## [#usage](Usage)

### [#1-add-bot-to-group-chat](1. Add Bot to Group Chat)

- Open group chat in Feishu
- Click Group Settings → Group Bots → Add Bot
- Select your DavyBot
- Confirm addition
### [#2-interact-with-bot](2. Interact with Bot)

@ mention the bot in group chat and send messages:

```
`@DaweiBot Help me analyze this spreadsheet
@DaweiBot Use pdf skill to extract text
@DaweiBot Run code tests`
```

**Conversation Example**:

### [#3-skill-invocation](3. Skill Invocation)

Use`@skill:`syntax to invoke specific skills:

```
`@DaweiBot @skill:pdf How to extract tables from PDF?
@DaweiBot @skill:code Help me refactor this code
@DaweiBot @skill:data Analyze this dataset`
```

### [#4-file-upload](4. File Upload)

Upload files directly in chat, bot will process automatically:

- **PDF Files**: Automatically use PDF skills
- **Excel Files**: Use data processing skills
- **Images**: Use OCR skills to extract text
- **Code Files**: Use code analysis skills
## [#advanced-features](Advanced Features)

### [#custom-commands](Custom Commands)

Create custom command templates:

```
`# custom-commands.yaml
commands:
  - name: "daily report"
    template: "Generate daily work report including: completed tasks, issues encountered, tomorrow's plan"
  - name: "code review"
    template: "Review the following code, identify potential issues and improvement suggestions"`
```

### [#webhook-integration](Webhook Integration)

Configure webhooks to receive external events:

```
`webhooks:
  - url: "https://your-service.com/webhook"
    events:
      - task_completed
      - error_occurred
    headers:
      Authorization: "Bearer your-token"`
```

### [#permission-control](Permission Control)

Set permissions for different user groups:

```
`permissions:
  admins:
    - user_123
    - user_456
  users:
    - user_789
  permissions:
    admins:
      - skill:all
      - workspace:all
    users:
      - skill:limited
      - workspace:own`
```

## [#troubleshooting](Troubleshooting)

### [#issue-1-bot-not-responding](Issue 1: Bot Not Responding)

**Possible Causes**:

- Plugin not enabled
- Event subscription misconfigured
- Verification token mismatch

**Solutions**:

```
`# Check plugin status
dawei plugins status feishu

# View logs
dawei logs --plugin feishu

# Reload plugin
dawei plugins reload feishu`
```

### [#issue-2-message-send-failed](Issue 2: Message Send Failed)

**Checklist**:

- Network connection is normal
- API credentials are correct
- Feishu app permissions granted
- Message format meets requirements
### [#issue-3-skills-cannot-be-invoked](Issue 3: Skills Cannot Be Invoked)

**Solutions**:

```
`# Check skill list
dawei skills list

# Verify skill permissions
dawei plugins check-permissions feishu`
```

## [#security-recommendations](Security Recommendations)

- 

**Protect Sensitive Information**:

- Don’t hardcode API keys in code
- Use environment variables for secrets
- Rotate keys regularly
- 

**Access Control**:

- Limit plugin permissions
- Use whitelist mode
- Maintain audit logs
- 

**Data Encryption**:

- Enable message encryption
- Use HTTPS for communication
- Encrypt sensitive data at rest
## [#best-practices](Best Practices)

- **Naming Conventions**: Use clear app names and descriptions
- **Error Handling**: Implement robust error handling
- **Logging**: Log key operations and errors
- **Testing**: Test thoroughly in staging environment
- **Monitoring**: Set up monitoring and alerts
- **Documentation**: Maintain detailed plugin documentation
## [#develop-custom-plugins](Develop Custom Plugins)

If you want to develop your own plugins, please refer to:

[../plugin-development.html](Plugin Development Guide)

## [#related-resources](Related Resources)

- [https://open.feishu.cn/document/home-en](Feishu Open Platform Documentation)
- [../api/plugin-api.html](Plugin API Documentation)
- [https://github.com/davybot-plugins](Community Plugin List)[../../user/skills/work-with-skills.html]()[../../user/skills/work-with-skills.html]()