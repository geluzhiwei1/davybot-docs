Working with Skills - DaweiBot (English)
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
# [#working-with-skills---user-guide](Working with Skills - User Guide)

## [#introduction](Introduction)

**Skills**are Dawei’s way of sharing expertise and best practices. Think of them as “how-to guides” that help the AI assistant perform specialized tasks more effectively.

When you give Dawei a task, it can reference relevant skills to ensure it follows proven workflows and industry best practices.

### [#what-problems-do-skills-solve](What Problems Do Skills Solve?)

- **Inconsistency**: Different approaches to the same task each time
- **Re-explanation**: Repeatedly explaining how you like things done
- **Best Practices**: Ensuring the agent uses proven methods
- **Complex Workflows**: Multi-step processes that require specific expertise
## [#understanding-skills](Understanding Skills)

### [#skill-structure](Skill Structure)

A skill consists of:

```
`my-skill/
├── SKILL.md              # Main instructions (required)
├── template.py           # Example templates (optional)
├── config.json           # Reference configs (optional)
└── README.md             # Additional docs (optional)`
```

### [#whats-inside-a-skill](What’s Inside a Skill?)

Open any`SKILL.md`and you’ll find:

```
`---
name: pdf
description: PDF processing, OCR, and extraction workflows
---

# PDF Processing Skill

This skill guides you through working with PDF files...

## Common Workflows

### Extract Text from PDF
1. Use the pdf_extractor tool...
2. For scanned PDFs, first apply OCR...

### Extract Tables
1. Convert PDF to images...
2. Use OCR with table detection...`
```

## [#discovering-available-skills](Discovering Available Skills)

### [#via-cli](Via CLI)

List all available skills:

```
`# See all skills
dawei skills list

# Search for specific skills
dawei skills search pdf
dawei skills search "table extraction"
dawei skills search web`
```

### [#via-tui](Via TUI)

In the TUI (Text User Interface), use the`@skill:`syntax:

```
`# While typing your request
User: @skill:pdf How do I extract tables from a scanned PDF?`
```

The TUI will:

- Show available skills that match your query
- Auto-suggest skill names as you type`@skill:`
- Display skill descriptions for preview
### [#via-web-ui](Via Web UI)

Access skills through the web interface:

- Navigate to**Skills**section
- Browse all available skills
- Search by keyword
- View skill details and resources
## [#using-skills](Using Skills)

### [#implicit-usage-recommended](Implicit Usage (Recommended))

Just describe your task naturally - Dawei will automatically find relevant skills:

```
`User: Extract tables from this scanned PDF document

# Dawei automatically:
# 1. Searches for relevant skills (finds "pdf" skill)
# 2. Loads the skill instructions
# 3. Follows the recommended workflow for table extraction
# 4. Uses appropriate tools (pdf2image, OCR, table extraction)`
```

### [#explicit-usage](Explicit Usage)

Request a specific skill directly:

```
`User: @skill:pdf Help me process this invoice PDF

# Dawei will:
# 1. Load the pdf skill
# 2. Apply pdf-specific workflows
# 3. Use recommended tools and settings`
```

### [#practical-examples](Practical Examples)
[#example-1-pdf-processing](Example 1: PDF Processing)
```
`User: I have a scanned contract PDF. I need to extract all the text

# What Dawei does (using pdf skill):
# 1. Recognizes this is a PDF task
# 2. Loads the pdf skill
# 3. Follows the OCR workflow for scanned PDFs
# 4. Uses pdf2image + pytesseract
# 5. Returns extracted text with confidence scores`
```
[#example-2-excel-processing](Example 2: Excel Processing)
```
`User: Summarize the sales data in this Excel file

# What Dawei does (using xlsx skill):
# 1. Loads the xlsx skill
# 2. Reads the Excel file structure
# 3. Identifies data patterns
# 4. Creates summary statistics
# 5. Generates insights following xlsx best practices`
```
[#example-3-web-development](Example 3: Web Development)
```
`User: @skill:frontend-design Create a responsive dashboard layout

# What Dawei does (using frontend-design skill):
# 1. Loads frontend design skill
# 2. Follows responsive design principles
# 3. Uses recommended CSS frameworks
# 4. Implements accessibility best practices
# 5. Generates clean, maintainable code`
```

## [#creating-custom-skills](Creating Custom Skills)

### [#when-to-create-a-custom-skill](When to Create a Custom Skill)

Create a skill when you:

- Have specific preferences for how tasks should be done
- Work in a specialized domain often
- Want to document team best practices
- Have complex workflows you repeat frequently
### [#step-by-step-create-your-first-skill](Step-by-Step: Create Your First Skill)
[#step-1-create-the-skill-directory](Step 1: Create the Skill Directory)

Skills live in your workspace under`.dawei/skills/`:

```
`# Navigate to your workspace
cd my-workspace

# Create a new skill directory
mkdir -p .dawei/skills/my-custom-skill
cd .dawei/skills/my-custom-skill`
```
[#step-2-write-skillmd](Step 2: Write SKILL.md)

Create the main skill file:

```
`---
name: my-custom-skill
description: Custom workflows for my specific needs
version: 1.0.0
author: Your Name
---

# My Custom Skill

## Purpose
This skill helps with [specific task] by following [your approach].

## Prerequisites
- Tool A is installed
- Configuration B is set up

## Workflow

### Step 1: Preparation
Always start by...
- Check for X
- Verify Y

### Step 2: Execution
Follow these steps:
1. First, do this...
2. Then, do that...
3. Finally, validate Z

### Step 3: Verification
Ensure the result meets these criteria:
- Criteria 1
- Criteria 2

## Common Patterns

### Pattern 1: [Name]
When [situation], use this approach:
\`\`\`python
# Example code
result = do_something()
\`\`\`

### Pattern 2: [Name]
For [different situation], do:
\`\`\`python
# Alternative approach
result = do_something_else()
\`\`\`

## Troubleshooting

### Issue: [Problem]
**Solution**: [Fix]

### Issue: [Another Problem]
**Solution**: [Different fix]

## Resources
- Link to external documentation
- Reference materials`
```
[#step-3-add-optional-resources](Step 3: Add Optional Resources)

Include helpful files in the same directory:

```
`# Add a template
cat > template.py << 'EOF'
def example_function():
    """Template function"""
    pass
EOF

# Add a configuration example
cat > config.example.json << 'EOF'
{
    "setting1": "value1",
    "setting2": "value2"
}
EOF`
```
[#step-4-test-your-skill](Step 4: Test Your Skill)
```
`# Verify Dawei can find it
dawei skills list | grep my-custom-skill

# Test using it
dawei agent run ./my-workspace "@skill:my-custom-skill Help me with..."`
```

### [#real-world-skill-examples](Real-World Skill Examples)
[#example-git-workflow-skill](Example: Git Workflow Skill)
```
`---
name: git-workflow
description: Git branching and commit conventions for our team
version: 1.0.0
---

# Team Git Workflow

## Branch Naming
- Feature branches: `feature/ISSUE-DESCRIPTION`
- Bugfix branches: `bugfix/ISSUE-DESCRIPTION`
- Hotfix branches: `hotfix/VERSION-DESCRIPTION`

## Commit Messages
Format: `ISSUE: Brief description`

Example: `DAWEI-123: Add user authentication`

## Workflow
1. Create feature branch from main
2. Make commits with proper messages
3. Push to remote
4. Create PR with template
5. Request review
6. Address feedback
7. Merge after approval

## PR Template
\`\`\`
## Summary
- [ ] Change 1
- [ ] Change 2

## Testing
- [ ] Unit tests pass
- [ ] Manual testing done
\`\`\``
```
[#example-code-review-skill](Example: Code Review Skill)
```
`---
name: code-review
description: Code review guidelines and checklist
version: 1.0.0
---

# Code Review Guidelines

## Checklist
- [ ] Code follows project style guide
- [ ] No hardcoded secrets
- [ ] Error handling implemented
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] No obvious performance issues
- [ ] Security vulnerabilities checked

## What to Look For

### Security
- SQL injection vulnerabilities
- XSS vectors
- Auth/authorization issues
- Sensitive data in logs

### Performance
- N+1 query problems
- Missing indexes
- Unnecessary loops
- Memory leaks

### Maintainability
- Clear variable names
- Appropriate comments
- Function length < 50 lines
- DRY principle followed`
```

## [#skill-management](Skill Management)

### [#viewing-skills](Viewing Skills)

```
`# List all skills
dawei skills list

# View skill details
dawei skills get pdf

# View skill content
dawei skills content pdf`
```

### [#updating-skills](Updating Skills)

Edit the`SKILL.md`file directly:

```
`# Workspace skill (editable)
vim .dawei/skills/my-skill/SKILL.md

# Changes take effect immediately`
```

### [#deleting-skills](Deleting Skills)

```
`# Remove workspace skill
rm -rf .dawei/skills/my-skill

# Note: System skills cannot be deleted`
```

## [#organizing-skills](Organizing Skills)

### [#by-domain](By Domain)

```
`.dawei/skills/
├── development/
│   ├── python/
│   ├── javascript/
│   └── testing/
├── data/
│   ├── analysis/
│   └── visualization/
└── ops/
    ├── deployment/
    └── monitoring/`
```

### [#by-workflow](By Workflow)

```
`.dawei/skills/
├── data-processing/
├── report-generation/
├── code-review/
└── deployment/`
```

### [#by-project](By Project)

```
`.dawei/skills/
├── project-alpha/
├── project-beta/
└── common/`
```

## [#skill-modes](Skill Modes)

Skills can be mode-specific to adapt to different contexts:

```
`# General skills (always available)
.dawei/skills/
└── common/

# Web development mode
.dawei/skills-web/
└── frontend/

# Data analysis mode
.dawei/skills-data/
└── visualization/`
```

When you set a workspace mode, Dawei prioritizes mode-specific skills:

```
`# Set workspace mode
dawei workspace set-mode web

# Now web-specific skills are prioritized`
```

## [#best-practices](Best Practices)

### [#writing-good-skills](Writing Good Skills)

- **Be Specific**: Clear, actionable instructions
- **Provide Examples**: Show, don’t just tell
- **Include Edge Cases**: What to do when things go wrong
- **Keep Updated**: Review and revise regularly
- **Version Control**: Track changes to skills
### [#skill-design-principles](Skill Design Principles)

- **Single Purpose**: Each skill should focus on one domain
- **Progressive**: Start simple, add detail gradually
- **Testable**: Skills should produce consistent results
- **Maintainable**: Easy to update and improve
### [#common-mistakes-to-avoid](Common Mistakes to Avoid)

- ❌ Skills that are too generic
- ❌ Missing edge cases
- ❌ Outdated information
- ❌ Unclear workflows
- ❌ Missing examples
## [#advanced-usage](Advanced Usage)

### [#skill-composition](Skill Composition)

Skills can reference other skills:

```
`## Workflow
1. First, apply @skill:setup-environment
2. Then, use @skill:build-process
3. Finally, run @skill:deploy-checklist`
```

### [#conditional-logic](Conditional Logic)

Guide the agent with conditionals:

```
`## Approach Selection

If the file is larger than 100MB:
- Use streaming approach
- Process in chunks

If the file is smaller:
- Load entirely into memory
- Process all at once`
```

### [#resource-files](Resource Files)

Include templates for the agent to use:

```
`## Template

Use the template from template.py as a starting point.

The agent can access it with:`
```

read_skill_resource(skill_name=“my-skill”, resource=“template.py”)

```
``
```

## [#troubleshooting](Troubleshooting)

### [#skill-not-found](Skill Not Found)

**Problem**: Dawei doesn’t see your skill

**Solutions**:

- Check directory structure:`.dawei/skills/your-skill/SKILL.md`
- Verify frontmatter has`name`field
- Ensure`name`matches directory name
- Run`dawei skills list`to verify
### [#wrong-skill-loaded](Wrong Skill Loaded)

**Problem**: Lower priority skill overriding higher priority

**Solutions**:

- Check skill locations (workspace > system > user)
- Verify mode-specific vs general skills
- Remove duplicate skill names
### [#skill-not-applied](Skill Not Applied)

**Problem**: Dawei not following your skill

**Solutions**:

- Make task description more explicit
- Use`@skill:name`to force specific skill
- Check that skill instructions are clear
- Verify skill is relevant to the task
## [#tips--tricks](Tips & Tricks)

### [#quick-skill-discovery](Quick Skill Discovery)

```
`# Find skills related to a topic
dawei skills search "data"

# See what resources a skill has
dawei skills resources pdf

# Preview skill content
dawei skills content pdf | head -50`
```

### [#skill-versioning](Skill Versioning)

Track versions in frontmatter:

```
`---
version: 2.1.0
changelog:
  - 2.1.0: Added OCR workflow
  - 2.0.0: Major restructure
  - 1.0.0: Initial release
---`
```

### [#team-collaboration](Team Collaboration)

Share skills through version control:

```
`# Commit skills to git
git add .dawei/skills/
git commit -m "Add data processing skill"

# Team members can pull updates
git pull`
```

## [#summary](Summary)

- **Skills**are expert knowledge that guides Dawei’s behavior
- **Discover**skills with`@skill:`syntax or natural language
- **Create**custom skills for your specific workflows
- **Organize**skills by domain, project, or workflow
- **Maintain**skills as living documents that evolve with your needs

Skills are a powerful way to make Dawei more effective for your specific use cases. Start with the built-in skills, then create your own as you discover patterns in your work.
[../../user/install.html]()[../../user/plugins/work-with-plugins.html]()[../../user/install.html]()[../../user/plugins/work-with-plugins.html]()