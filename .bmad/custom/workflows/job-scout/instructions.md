# Job Scout - Automated Job Board Search Instructions

<critical>The workflow execution engine is governed by: {project-root}/.bmad/core/tasks/workflow.xml</critical>
<critical>You MUST have already loaded and processed: {project-root}/.bmad/custom/workflows/job-scout/workflow.yaml</critical>
<critical>This workflow uses Playwright MCP tools to browse job sites - ensure browser tools are available</critical>

<workflow>

<step n="1" goal="Parse arguments and determine search parameters">
<action>Check if the user provided arguments when invoking the command</action>

<logic>
Arguments can be in format: `/job-scout [site] [role]`
- If no arguments: proceed to interactive mode (step 2)
- If site provided: store as {{selected_site}}
- If role provided: store as {{search_query}}
- If "all" is provided as site: search all sites sequentially
</logic>

<action>If arguments provided, skip to step 3 with stored values</action>
</step>

<step n="2" goal="Interactive site and role selection">
<ask>Which job site(s) would you like to search?

1. **Indeed** - Large job aggregator (worldwide)
2. **GetOnBoard** - LATAM tech focus (recommended for Chile)
3. **We Work Remotely** - Remote-only positions
4. **RemoteOK** - Remote tech jobs
5. **SimplyHired** - General job aggregator
6. **All** - Search all sites (takes longer)

Enter number or site name:</ask>

<action>Map selection to {{selected_site}} (indeed, getonboard, weworkremotely, remoteok, simplyhired, or all)</action>

<ask>What role type are you searching for?

Based on your target roles (95%+ fit):
1. **Senior Python Engineer** - Python-focused positions
2. **Senior Backend Engineer** - Backend/server-side roles
3. **Platform Engineer** - Infrastructure and tooling
4. **ML Engineer** - Machine learning positions
5. **Custom** - Enter your own search term

Enter number or search term:</ask>

<action>Map selection to {{search_query}}:
- 1 → "senior python engineer"
- 2 → "senior backend engineer"
- 3 → "platform engineer"
- 4 → "ML engineer"
- 5 → Ask for custom term
</action>
</step>

<step n="3" goal="Load profile context for evaluation">
<action>Read {target_roles_file} to understand role fit criteria</action>
<action>Read {skills_matrix_file} to get keyword matching data</action>

<action>Build evaluation criteria from profile:
- Primary skills: Python, Flask, FastAPI, AWS, PostgreSQL, Docker
- Secondary skills: ML/AI, ETL, data pipelines
- Experience level: 11 years, senior positions
- Location preference: Remote or Chile
- Salary expectations: Senior-level compensation
</action>
</step>

<step n="4" goal="Navigate to job site and search">
<action>For {{selected_site}} (or iterate if "all"), use Playwright tools:</action>

<playwright_sequence site="indeed">
1. Use `mcp__plugin_playwright_playwright__browser_navigate` to go to:
   `https://www.indeed.com/jobs?q={{search_query}}&l=Remote&remotejob=032b3046-06a3-4876-8dfd-474eb5e7ed11`
2. Wait for page load using `mcp__plugin_playwright_playwright__browser_wait_for` with time: 3
3. Take snapshot using `mcp__plugin_playwright_playwright__browser_snapshot`
4. Extract job listings from the snapshot
</playwright_sequence>

<playwright_sequence site="getonboard">
1. Navigate to: `https://www.getonbrd.com/jobs?q={{search_query}}&remote=true`
2. Wait 3 seconds for load
3. Take snapshot and extract listings
</playwright_sequence>

<playwright_sequence site="weworkremotely">
1. Navigate to: `https://weworkremotely.com/remote-jobs/search?term={{search_query}}`
2. Wait 3 seconds for load
3. Take snapshot and extract listings
</playwright_sequence>

<playwright_sequence site="remoteok">
1. Navigate to: `https://remoteok.com/remote-{{search_query_slug}}-jobs` (replace spaces with -)
2. Wait 3 seconds for load
3. Take snapshot and extract listings
</playwright_sequence>

<playwright_sequence site="simplyhired">
1. Navigate to: `https://www.simplyhired.com/search?q={{search_query}}&l=remote`
2. Wait 3 seconds for load
3. Take snapshot and extract listings
</playwright_sequence>
</step>

<step n="5" goal="Extract and parse job listings">
<action>From the browser snapshot, extract job information:
- Job title
- Company name
- Location (verify remote if applicable)
- Brief description or requirements visible
- Link/reference for the listing
</action>

<action>Store extracted jobs in {{raw_listings}} array with format:
```
{
  site: "{{selected_site}}",
  title: "...",
  company: "...",
  location: "...",
  description: "...",
  url: "..."
}
```
</action>

<action>If fewer than 5 jobs found, try scrolling down or clicking "Load more" if available, then re-snapshot</action>
</step>

<step n="6" goal="Evaluate job fit against profile">
<action>For each job in {{raw_listings}}, calculate fit score:</action>

<scoring_criteria>
**A - Great Match (8-10 points):**
- Title contains: "Senior", "Staff", "Lead" + "Python", "Backend", "Platform"
- Remote confirmed
- Mentions: Python, Flask, FastAPI, AWS, PostgreSQL
- Company seems tech-focused or interesting

**B - Good Match (5-7 points):**
- Mid-to-senior level position
- Relevant tech stack (some matches)
- Remote or LATAM-friendly

**C - Okay Match (3-4 points):**
- Related role but not perfect fit
- Some tech overlap
- Worth reviewing if easy to apply

**D - Weak Match (0-2 points):**
- Junior position
- Unrelated tech stack
- On-site only in non-Chile location
</scoring_criteria>

<action>Store evaluated jobs in {{scored_listings}} with fit_score (A/B/C/D) and reasoning</action>
</step>

<step n="7" goal="Present results to user">
<action>Sort {{scored_listings}} by fit score (A first, then B, etc.)</action>

<action>Present top matches (up to 10) in a formatted table:</action>

```
## Job Scout Results - {{date}}
**Search:** {{search_query}} on {{selected_site}}
**Found:** {{total_count}} listings, {{a_count}} great matches

### Top Matches

| # | Fit | Company | Role | Location | Notes |
|---|-----|---------|------|----------|-------|
| 1 | A | [Company] | [Title] | Remote | [Key tech matches] |
| 2 | A | [Company] | [Title] | Remote | [Key tech matches] |
...
```

<action>For each A or B match, offer to show more details by clicking into the listing</action>
</step>

<step n="8" goal="Add selected jobs to prospects">
<ask>Which jobs would you like to add to your prospects pipeline?

Enter numbers separated by commas (e.g., "1, 3, 5") or:
- "all-a" to add all A-rated matches
- "all-ab" to add all A and B matches
- "none" to skip

Selection:</ask>

<action>For each selected job, append to {prospects_file} using the same format as add-prospect workflow:

| {{date}} | {{company}} | {{title}} | {{selected_site}} | {{fit_score}} | New | {{notes}} |
</action>

<action>Confirm additions:</action>
```
Added {{count}} jobs to prospects.md:
- [Company 1] - [Role 1]
- [Company 2] - [Role 2]
...

Run `/add-prospect` to manually add more, or `/job-scout` to search other sites.
```
</step>

<step n="9" goal="Offer next actions">
<ask>What would you like to do next?

1. **Search another site** - Run job-scout on a different platform
2. **Search different role** - Try a different job type
3. **View a specific listing** - Click into a job for full details
4. **Review prospects** - Open docs/prospects.md
5. **Done** - End job scouting session

Enter choice:</ask>

<action>Route based on selection:
- 1 or 2: Loop back to step 2
- 3: Use Playwright to click the listing and show full description
- 4: Display prospects.md content
- 5: End workflow with summary
</action>
</step>

</workflow>

## Error Handling

<error_handling>
- If browser fails to load: Suggest checking MCP Playwright connection
- If no results found: Suggest trying different search terms or sites
- If site structure changed: Log issue and try alternative selectors
- If rate limited: Wait and retry, or move to next site
</error_handling>

## Tips for Best Results

- GetOnBoard is best for LATAM/Chile tech positions
- WeWorkRemotely and RemoteOK focus on remote-first companies
- Indeed has the most listings but also more noise
- Run during business hours for freshest listings
- Combine with `/add-prospect` for manual finds from other sources
