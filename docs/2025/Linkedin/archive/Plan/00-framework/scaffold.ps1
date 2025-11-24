$ErrorActionPreference = 'Stop'

# Ensure base directories that may be empty
$dirs = @(
  'Plan\10-backlog\ideas',
  'Posts\_template\assets',
  'Posts\_template\exports'
)

foreach ($d in $dirs) {
  if (-not (Test-Path $d)) {
    New-Item -ItemType Directory -Force -Path $d | Out-Null
  }
}

# Files to create with contents
$files = @{

'Plan\00-framework\writing-style-guide.md' = @'
# Writing Style Guide

Principles
- Lead with outcome and thesis in the first 2-3 lines.
- Prefer short sentences (12-18 words). Use active voice.
- Replace abstractions with concrete nouns, numbers, and examples.
- Cut filler words (very, really, actually, basically).
- Show one idea per paragraph.

Formatting
- Mobile-first: first lines must be skimmable standalone.
- Use H2/H3 to chunk sections. Bullets over long paragraphs.
- Use `code` style for terms, functions, or metrics.
- Link sources; quantify claims.

Clarity
- Define acronyms on first use.
- Prefer specific verbs (measure, ship, prune) over vague ones (do, handle).
- Replace weak claims with evidence or remove them.

Tone
- Direct, pragmatic, respectful. Confident, never hypey.

LinkedIn specifics
- 2-5 precise hashtags (#LLM #RAG #SoftwareEngineering).
- End with a CTA that invites specific replies.
- Break lines to create visual rhythm for scanning.
'@;

'Plan\00-framework\post-lifecycle.md' = @'
# Post Lifecycle

1) Idea capture
- Create one idea file in Plan/10-backlog/ideas/ as YYYYMMDD-idea.md using the brief template.
- Add a one-line summary to Plan/10-backlog/backlog.md.

2) Brief → Outline
- Fill Posts/_template/00-brief.md fields (Outcome, Thesis, Audience, Why now, Key points).
- Set post front matter status: outline.

3) Outline → Draft
- Structure H2s and bullets in 01-outline.md.
- Draft 02-draft.md freely, no polishing.

4) Polish
- Run checklist.md end-to-end.
- Tighten, add examples, ensure evidence and links.
- Update 03-polish.md with final notes. Status: scheduled.

5) Social
- Prepare 04-social.md (hooks, reply patterns, hashtags).
- Produce visuals into assets/ if needed.

6) Publish
- Save exports/final.md (canonical copy of post).
- Post to LinkedIn. Status: published.

7) Review
- Log KPIs in Plan/50-metrics/.
- Add standout patterns to Plan/30-research/swipe-file.md.

8) Repurpose
- Derive 2-3 short posts from the long-form post.
'@;

'Plan\00-framework\voice-and-tone.md' = @'
# Voice and Tone

Audience
- Senior engineers, builders, and tech-leaning product leaders.

Voice
- Builder-teacher: precise, concise, honest, curious.
- Defaults to clarity over cleverness.

Tone by pillar
- AI and Models: technical, evidence-driven, measured.
- Software Dev: practical, example-led, pattern-oriented.
- Builder Diaries: candid, reflective, concrete lessons.
- Macro/Trends: analytical, sober, cite sources.
- Operating System for Life: calm, actionable, non-preachy.

Phrases to favor
- "Here's the exact step...", "Measure it like this...", "Trade-off: ..."
Phrases to avoid
- Over-generalities, clickbait, vague hype.
'@;

'Plan\00-framework\hashtag-bank.md' = @'
# Hashtag Bank (pick 2-5 per post)

AI and Models
- #AI #MachineLearning #LLM #GenAI #RAG #MLOps #PromptEngineering #AIInfrastructure

Software Development
- #SoftwareEngineering #Backend #Architecture #APIs #Testing #DevEx #Performance #Observability

Builder Diaries
- #SaaS #IndieHackers #ProductDevelopment #Postmortem #CaseStudy

Trends
- #TechTrends #Automation #Data #OpenSource #Cloud

Operating System for Life
- #Productivity #Learning #MentalModels #Career #DecisionMaking

Notes
- Prefer niche/precise tags over generic ones. Keep to 2-5 max.
'@;

'Plan\00-framework\prompts.md' = @'
# Prompt Snippets (paste and adapt)

Ideate
- "List 10 angles for a LinkedIn post about [topic] for [audience] with concrete examples."

Outline
- "Draft a 5-point outline for [thesis]. Include 1 example per point, optimize for LinkedIn scanning."

Draft
- "Turn this outline into a 400-700 word LinkedIn post with short paragraphs and a strong 2-3 line hook: [outline]"

Tighten
- "Cut this paragraph to half the words without losing meaning. Prefer active voice and concrete nouns: [text]"

Hooks
- "Suggest 10 hooks focused on outcomes and contrasts for this thesis: [thesis]"

Evidence
- "Find weak claims in this draft and propose stronger evidence or specific numbers: [draft]"

CTA
- "Create 5 CTAs that invite specific, experience-based replies related to [topic]."

Summaries
- "Create 3 tweet-length summaries of this post: [post]"

Research
- "Summarize the linked source in 5 bullets with 1 pull-quote and a citation-ready link: [url]"

Rewrite tone
- "Rewrite the following in a more direct, pragmatic tone. Remove hedging: [text]"
'@;

'Plan\10-backlog\backlog.md' = @'
# Backlog

Usage
- Keep ideas moving between Now → Next → Later.
- One line per idea; link to its idea file (in ideas/) or post folder when created.

## Now
- [ ] 

## Next
- [ ] 

## Later
- [ ] 
'@;

'Plan\20-calendar\2025-08.md' = @'
# August 2025 Content Calendar

| Date       | Post                               | Status   | Link |
|------------|------------------------------------|----------|------|
| 2025-08-21 |                                    | draft    |      |
| 2025-08-25 |                                    |          |      |
| 2025-08-28 |                                    |          |      |

Status legend: draft | outline | writing | polish | scheduled | published
'@;

'Plan\30-research\swipe-file.md' = @'
# Swipe File (what to reuse and why)

## [Link or title]
- Why it worked:
- Structure worth reusing:
- Hook pattern:
- Notable phrasing:
- Visual pattern:
- Notes to self:

## [Link or title]
- Why it worked:
- Structure worth reusing:
- Hook pattern:
- Notable phrasing:
- Visual pattern:
- Notes to self:
'@;

'Plan\30-research\sources.md' = @'
# Sources Hub

Papers
- 

Articles
- 

Videos/Talks
- 

Repos
- 

Datasets/Benchmarks
- 

People to follow
- 
'@;

'Plan\40-personas\personas.md' = @'
# Personas

## Senior Backend Engineer
- Goals: ship reliable systems, learn AI pragmatically
- Frustrations: vague advice, hype without numbers
- Interests: evaluation, performance, architecture patterns
- Content they like: case studies, benchmarks, step-by-steps

## Tech Product Lead
- Goals: identify pragmatic AI opportunities
- Frustrations: fluffy strategy, no trade-offs
- Interests: ROI, risks, team workflows
- Content they like: concise briefs, decision trees, checklists
'@;

'Plan\50-metrics\kpis.md' = @'
# KPIs

Post-level
- Impressions: total views.
- Reactions: likes/celebrates/etc.
- Comments: count and quality.
- Reposts/Shares.
- Saves.
- Profile visits from post.
- Follows gained from post.
- CTR: link clicks / impressions.

Rates (compute weekly/monthly)
- Engagement rate = (Reactions + Comments + Reposts) / Impressions.
- Save rate = Saves / Impressions.
- Follow conversion = Follows / Impressions.

Tracking
- Log per-post in a spreadsheet or note.
- Review monthly using monthly-review-template.md.
'@;

'Plan\50-metrics\monthly-review-template.md' = @'
# Monthly Review

Summary
- What worked:
- What didn't:
- Top 3 posts and why:

Metrics (month)
- Total posts:
- Avg engagement rate:
- Total saves:
- Follows gained:

Experiments
- Hypothesis:
- Result:
- Next action:

Next month
- Focus:
- Topics to double down on:
- Process tweaks:
'@;

'Plan\60-mood\mood-log.csv' = @'
date,mood(1-5),energy(1-5),focus(1-5),work_block,notes
'@;

'Plan\60-mood\mood-journal.md' = @'
# Mood Journal (daily)

Date: 
Mood (1-5): 
Energy (1-5): 
Focus (1-5): 
Work block / context:
Notes:
'@;

'Posts\_template\post.md' = @'
---
title: "Working title"
slug: "working-title"
status: draft
pillar: ai # ai | dev | diary | trends | life
audience: "Senior backend engineers curious about LLMs"
goal: "Educate and attract profile visits and follows"
primary_takeaway: "Key insight in one line"
keywords: ["llm eval", "rag", "prompting"]
hashtags: ["#AI", "#SoftwareEngineering"]
created_at: 2025-08-21
planned_publish_at: 2025-08-25
platforms: ["LinkedIn"]
canonical_url:
links: []
reading_time_min: 4
---

# Title

Hook (2-3 short lines).  
State the problem and the promise.

## 1) Point
- Example/evidence

## 2) Point
- Example/evidence

## 3) Point
- Example/evidence

Recap + clear CTA (invite specific replies).
'@;

'Posts\_template\00-brief.md' = @'
# Brief

Outcome: ...
Thesis: ...
Angle: ...
Audience: ...
Why now: ...
3-5 key points:
- ...
Evidence/Examples:
- ...
CTA: ...
'@;

'Posts\_template\01-outline.md' = @'
# Outline

Hook: ...
Intro (problem + promise): ...

H2: Point 1
- proof/example

H2: Point 2
- proof/example

H2: Point 3
- proof/example

Close (recap + CTA): ...
'@;

'Posts\_template\02-draft.md' = @'
# Draft

Write freely. Ignore polish. Leave TODOs inline like: [TODO: add metric/source].
'@;

'Posts\_template\03-polish.md' = @'
# Polish Notes

- Tightened sentences
- Added examples/numbers
- Checked flow and headings
- Verified links/sources
- Final CTA sharpened
- Hashtags selected
'@;

'Posts\_template\04-social.md' = @'
# Social Assets

Hooks
- The trap: ...
- You're not under-optimizing X; you're over-optimizing Y.
- Most advice says [...]. Here's what actually works: [...]

Comment reply patterns
- Thanks + 1-liner insight + question back
- Ask for their example, not their opinion

Hashtag set
- #AI #SoftwareEngineering #LLM #Productivity
'@;

'Posts\_template\research.md' = @'
# Research

Questions to validate
- ...

Sources (links)
- ...

Quotes/snippets
- ...
'@;

'Posts\_template\checklist.md' = @'
# Pre-publish Checklist

- [ ] Clear thesis in first 2-3 lines
- [ ] Concrete examples/numbers
- [ ] Remove filler/adverbs
- [ ] Skimmable headings
- [ ] Visual/diagram ready (if needed)
- [ ] CTA + next step
- [ ] Hashtags (2-5, specific)
- [ ] Scheduled time set
'@;

'Posts\_template\references.md' = @'
# References

- [Title](url) - 1-line summary, key stat/quote.
- [Title](url) - 1-line summary, key stat/quote.
'@;

}

# Create parent dirs and write files
foreach ($path in $files.Keys) {
  $parent = Split-Path -Parent $path
  if (-not (Test-Path $parent)) {
    New-Item -ItemType Directory -Force -Path $parent | Out-Null
  }
  $content = $files[$path]
  $content | Set-Content -Path $path -Encoding UTF8
}

Write-Host "LinkedIn content framework scaffolding script completed. Run it to generate all files."

