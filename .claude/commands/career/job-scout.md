# Job Scout

Automatically browse public job boards using Playwright, find positions matching your profile, and add promising ones to your prospects pipeline.

## Instructions

IT IS CRITICAL THAT YOU FOLLOW THESE STEPS:

<steps CRITICAL="TRUE">
1. Always LOAD the FULL @.bmad/core/tasks/workflow.xml
2. READ its entire contents - this is the CORE OS for EXECUTING workflows
3. Pass the yaml path `.bmad/custom/workflows/job-scout/workflow.yaml` as 'workflow-config' parameter to the workflow.xml instructions
4. Follow workflow.xml instructions EXACTLY as written to process and follow the specific workflow config and its instructions
</steps>

This workflow will:
- Ask which job sites to search (or search all)
- Use your target roles from `docs/career/target-roles.md` to build search queries
- Navigate to job boards using Playwright browser automation
- Extract job listings and evaluate fit against your profile
- Present top matches for your review
- Optionally add selected jobs to `docs/prospects.md`

## Supported Job Sites

Currently supports these public (no-login-required) job boards:
- **Indeed** - General job aggregator
- **GetOnBoard** - LATAM tech focus (great for Chile)
- **We Work Remotely** - Remote-only positions
- **RemoteOK** - Remote tech jobs
- **SimplyHired** - General job aggregator

## Usage Examples

```
/job-scout                    # Interactive - choose site and roles
/job-scout indeed python      # Search Indeed for Python roles
/job-scout getonboard         # Search GetOnBoard with default roles
/job-scout all backend        # Search all sites for backend roles
```
