# LinkedIn Writing Framework

Purpose
- Capture ideas, track mood, and ship LinkedIn articles consistently.
- Reuse a clean post template and keep planning artifacts organized.

Folder map
- Plan/
  - 00-framework/: style guide, lifecycle, prompts, scripts
  - 10-backlog/: backlog and ideas
  - 20-calendar/: monthly calendar
  - 30-research/: swipe file and sources
  - 40-personas/: target readers
  - 50-metrics/: KPIs and monthly review
  - 60-mood/: mood log and journal
- Posts/
  - _template/: reusable post kit
  - YYYY-MM-DD-title-kebab/: one folder per post

Requirements
- Windows with PowerShell (5+ or 7+).
- VS Code recommended.

Setup (first time)
1) Ensure scripts can run when invoked explicitly:
- You can always run scripts with `-ExecutionPolicy Bypass` (no global change).
2) Open Plan/00-framework/quick-start.md and skim the flow.
3) Optional (recommended): set VS Code to UTF-8 to avoid mojibake:
```json
{
  "files.encoding": "utf8",
  "files.autoGuessEncoding": true
}
```

Create a new post (two options)
- Manual
  - Copy Posts/_template to Posts/YYYY-MM-DD-title-kebab
  - Edit post.md front matter and start with 00-brief.md
- Scripted
  - PowerShell
```powershell
# From repo root
powershell -NoProfile -ExecutionPolicy Bypass -File "Plan/00-framework/new-post.ps1" -Title "My Post Title" -Pillar ai -PlannedPublishAt 2025-08-25
```
  - The script creates the folder, copies the template, and sets post.md front matter:
    - title, slug, pillar, created_at, planned_publish_at (optional)

Recommended writing flow
1) 00-brief.md: Outcome, Thesis, Audience, Why now, Key points
2) 01-outline.md: Hook + H2s + bullets
3) 02-draft.md: Write freely, allow TODOs
4) 03-polish.md: Tighten, add examples, verify links; run checklist.md
5) 04-social.md: Hooks, replies, hashtags; add assets/ if needed
6) exports/final.md: Canonical copy for publishing

Planning and tracking
- Backlog: Plan/10-backlog/backlog.md and Plan/10-backlog/ideas/
- Calendar: Plan/20-calendar/YYYY-MM.md
- Research: Plan/30-research/swipe-file.md and sources.md
- Personas: Plan/40-personas/personas.md
- Metrics: Plan/50-metrics/kpis.md and monthly-review-template.md
- Mood: Plan/60-mood/mood-log.csv (append daily), mood-journal.md (optional)

Fixing encoding artifacts (“â€””, “Â ”, etc.)
- Run the normalization script to clean up punctuation and mojibake across files:
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "Plan/00-framework/normalize-text.ps1" -Path "."
```
- Keep VS Code encoding as UTF-8 (see Setup) to prevent recurrence.

One-time scaffold (already done here)
- If starting fresh in another workspace, generate the structure:
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "Plan/00-framework/scaffold.ps1"
```

Tips
- Use Plan/00-framework/prompts.md to ideate, outline, and tighten.
- Keep posts skimmable on mobile; lead with a strong 2–3 line hook.
- Derive 2–3 short posts from each long-form piece.

Troubleshooting
- “File cannot be loaded because running scripts is disabled”:
  - Always invoke with `-ExecutionPolicy Bypass` as shown.
- Encoding symbols still appear:
  - Re-run normalize-text.ps1
  - Ensure VS Code saves as UTF-8 and reopen affected files.
