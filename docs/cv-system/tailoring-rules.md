# CV Tailoring Rules - Gabriel Cárcamo

> **Step-by-Step Guide for Customizing CVs**
>
> Follow this playbook every time you apply for a role to maximize your chances.

**Last Updated:** 2025-11-24
**Purpose:** Systematic approach to tailoring CVs for specific applications
**Time Required:** 30-60 minutes per application (worth it!)

---

## The Tailoring Process (6 Steps)

```
1. Analyze Job Description → Extract requirements
2. Identify Role Type → Use target-roles.md
3. Select Positioning Strategy → Use foda-analysis.md
4. Choose Relevant Content → From master-cv.md
5. Optimize for ATS → Use skills-matrix.md
6. Quality Check → Final review
```

---

## Step 1: Analyze Job Description (10 min)

### What to Extract:

**1. Required vs Preferred Skills**
- ✅ **Required (Must-Have):** Deal-breakers, focus here first
- ⚠️ **Preferred (Nice-to-Have):** Mention if you have them
- 📝 **Create two lists:** "Must address" and "Bonus points"

**2. Keywords & Buzzwords**
- Tools: Languages, frameworks, platforms
- Skills: Problem-solving, collaboration, leadership
- Domain: Industry terms, methodologies
- 📝 **Highlight all keywords in job description**

**3. Role Emphasis**
- Is it more IC (individual contributor) or leadership?
- Backend-heavy or full-stack?
- Greenfield (new projects) or maintenance?
- Startup (wear many hats) or enterprise (specialized)?
- 📝 **Note the balance:** "70% backend, 30% collaboration"

**4. Company Culture Clues**
- Language tone: Formal vs casual?
- Values mentioned: Innovation, stability, speed, quality?
- Team structure: Small team vs large org?
- 📝 **Adjust your tone to match**

### Analysis Template:

```markdown
**Company:** [Name]
**Role:** [Title]
**Role Type:** [From target-roles.md]

**Required Skills I Have:**
- [Skill 1] - [Evidence from my experience]
- [Skill 2] - [Evidence]
...

**Preferred Skills I Have:**
- [Skill 1] - [Evidence]
...

**Skills I Lack:**
- [Skill 1] - [How I'll address: learning, related experience, etc.]
...

**Top Keywords (10-15):**
1. [Keyword] - [My proficiency from skills-matrix.md]
2. [Keyword]
...

**Role Emphasis:**
- [X]% Backend / [Y]% Frontend
- [X]% IC work / [Y]% Leadership
- [Primary focus area]

**Company Culture:**
- [Formal/Casual]
- Values: [Innovation, Quality, Speed, etc.]
- Team: [Startup/Enterprise, Small/Large]
```

---

## Step 2: Identify Role Type (5 min)

### Consult [target-roles.md](target-roles.md)

Match job description to one of these categories:

1. Senior Backend Engineer
2. Senior Python Engineer
3. Platform Engineer
4. Staff Engineer / Tech Lead
5. ML Engineer
6. Data Engineer
7. Full-Stack Engineer (Backend-heavy)
8. Solutions Architect
9. DevOps / SRE Engineer
10. Mainframe Modernization Consultant

### Use the "Fit Score" to Guide:
- 🟢 **90-100%:** Apply confidently, emphasize strengths
- 🟡 **70-89%:** Apply, address gaps proactively
- 🔴 **<70%:** Consider if worth applying (maybe stretch role)

### Reference:
- Use "Lead With" section for professional summary
- Use "Emphasize" list for content selection
- Use "Address Gaps" section for honest positioning
- Use "Sample Achievement Bullets" for inspiration

---

## Step 3: Select Positioning Strategy (5 min)

### Consult [foda-analysis.md](foda-analysis.md)

**Use the Strategic Positioning Matrix:**

For this role type, which strengths should I emphasize?
- Check "When to Emphasize STRENGTHS" table
- Example: Backend role → Emphasize "Backend depth", "Autonomy", "Long-term vision"

Which weaknesses might be concerns?
- Check "When to Address WEAKNESSES" table
- Example: Full-stack role → Address "Frontend gaps" proactively

Which opportunities can I leverage?
- Check "How to Leverage OPPORTUNITIES"
- Example: Remote role → Emphasize "Remote work capability", "Autonomous"

Which threats should I counter?
- Check "How to Defend Against THREATS"
- Example: Youth competition → Emphasize "12+ years", "Deep experience"

### Positioning Decisions:

```markdown
**Strengths to Emphasize:**
1. [Strength from FODA]
2. [Strength]

**Gaps to Address:**
1. [Weakness] - [How to frame it]

**Opportunities to Highlight:**
1. [Opportunity] - [How I fit]

**Threats to Counter:**
1. [Threat] - [My defense]
```

---

## Step 4: Choose Relevant Content (20 min)

### 4A: Professional Summary

**Formula:**
```
[Title] with [X years] [core expertise] experience. [Top 3 skills relevant to role].
[Major achievement quantified]. [Passion/direction aligned with company].
```

**Example for Backend Role:**
```
Senior Software Engineer with 11 years building scalable backend systems in Python,
C, and SQL. Expert in API development, database optimization, and cross-platform
integration. Reduced production system runtime by 94% (4 hours → 15 minutes) through
algorithmic optimization. Passionate about building reliable, high-performance
systems serving millions of users.
```

**Example for ML Role:**
```
ML Engineer with 11 years software engineering and deep machine learning expertise.
Built end-to-end ML pipelines for predictive modeling, credit risk, and data analysis.
Developed neural network framework from scratch demonstrating ML fundamentals mastery.
Eager to apply ML engineering best practices to production systems at scale.
```

**Customization Checklist:**
- ✅ Includes top 3-5 keywords from job description
- ✅ Emphasizes skills required for role
- ✅ Quantifies at least one achievement
- ✅ Mentions relevant domain if specified (fintech, healthtech, etc.)
- ✅ Tone matches company culture (formal vs casual)
- ✅ Length: 3-4 sentences (50-80 words)

---

### 4B: Skills Section

**Organization Options:**

**Option A: Categorized (Recommended)**
```markdown
**Languages:** Python (13+ years), C, C++, SQL, Shell (Bash/Ksh), JavaScript
**Backend:** Flask, Django (familiar), RESTful API, Microservices
**Data:** Pandas, NumPy, Scikit-learn, ETL Pipelines, PostgreSQL, MySQL, DB2
**Cloud & DevOps:** AWS (Lambda, EC2, S3), Docker, Git, CI/CD, Linux/Unix
**Methodologies:** Agile, Scrum, System Design, Performance Optimization
```

**Option B: Simple List (If space constrained)**
```markdown
Python (13+ years), C, C++, SQL, Flask, Pandas, NumPy, PostgreSQL, AWS, Docker,
Git, Agile, API Development, ETL, Machine Learning, Shell Scripting
```

**Tailoring Rules:**
1. **Lead with most relevant category** for the role
   - Backend role → Languages first
   - ML role → Data & ML first
   - DevOps role → Cloud & DevOps first

2. **Include all required skills** from job description (if you have them)

3. **Add years for impressive skills:** "Python (13+ years)"

4. **Group related skills:** "AWS (Lambda, EC2, S3)" not separate bullets

5. **Include "familiar" or "working knowledge"** for stretch skills:
   - "Django (familiar)" = I've used it but not expert
   - Don't claim expertise you lack!

6. **Omit irrelevant skills:**
   - Don't mention mainframe for startup roles
   - Don't mention niche tools unless requested

7. **Use job description terminology:**
   - If they say "PostgreSQL" use "PostgreSQL" not "Postgres"
   - If they say "RESTful APIs" use "RESTful APIs" not just "APIs"

---

### 4C: Professional Experience

**Selection Strategy:**

From [master-cv.md](master-cv.md), choose 4-6 bullet points PER role that:
1. ✅ Align with job requirements
2. ✅ Include keywords from job description
3. ✅ Demonstrate quantified impact
4. ✅ Show progression and growth
5. ✅ Tell a coherent story

**The XYZ Formula (Google Method):**
```
Accomplished [X] as measured by [Y] by doing [Z]
```

**Examples:**

**For Backend Role:**
```
• Architected and optimized credit risk model execution pipeline, reducing runtime
  from 4+ hours to 15 minutes through dependency graph analysis and selective
  re-computation strategies

• Developed production Flask CRM application with secure authentication, file upload
  system, and PostgreSQL backend serving medical practice workflows

• Built cross-platform validation framework automating model comparison across
  mainframe, Linux, and AWS, reducing QA time by 70%
```

**For ML Role:**
```
• Designed end-to-end ML pipeline framework with configurable architecture for data
  extraction, feature engineering, model training, and automated evaluation across
  multiple prediction tasks

• Built Artificial Neural Network from scratch in Python/NumPy demonstrating deep
  understanding of backpropagation, gradient descent, and neural architecture design

• Developed student desertion prediction system achieving 75%+ accuracy, enabling
  early intervention strategies for university retention
```

**For Staff Engineer / Tech Lead:**
```
• Led technical architecture and coordination across 4 engineering teams implementing
  credit risk models spanning mainframe, distributed, and cloud platforms for major
  financial institutions

• Provided technical mentorship to external client data science teams and internal
  engineers through workshops on model development, AWS migration, and debugging

• Established cross-platform migration procedures adopted organization-wide, reducing
  subsequent migration timelines by 40%
```

**Bullet Point Checklist:**
- ✅ Starts with strong action verb (Led, Designed, Built, Optimized)
- ✅ Includes context (what, where, for whom)
- ✅ Includes quantified result (94% reduction, 4+ teams, 300M users)
- ✅ Uses keywords from job description naturally
- ✅ Demonstrates impact, not just activity ("Built X" → "Built X enabling Y")
- ✅ Specific, not generic ("Wrote Python code" ❌ vs "Built Flask CRM app" ✅)

**Bullet Point Priority System:**

Mark each bullet from master-cv.md:
- **P0 (Must Include):** Directly matches job requirement
- **P1 (Should Include):** Relevant, shows strength
- **P2 (Nice to Have):** Tangentially relevant
- **P3 (Skip):** Not relevant to this role

For each job position, include:
- All P0 bullets
- Top 3-4 P1 bullets
- 0-1 P2 bullets if space allows
- Skip all P3 bullets

---

### 4D: Projects Section (Optional)

**When to Include:**
- ✅ Recent grad or early career (show hands-on work)
- ✅ Career changer (demonstrate new skills)
- ✅ Gap in employment (show continued technical activity)
- ✅ Applying for niche role where personal projects are highly relevant

**When to Skip:**
- ❌ Senior with extensive professional experience (work experience is stronger)
- ❌ Space constrained CV (prioritize professional experience)

**If Including, Select 2-3 Projects:**

**Selection Criteria:**
1. Most relevant to target role
2. Most impressive technically
3. Most recent (if possible)

**Example for ML Role:**
```
**Artificial Neural Network Framework** | Python, NumPy
Built complete ANN with dynamic architecture (YAML config), full backpropagation,
gradient calculation, and weight visualization. Demonstrates deep ML fundamentals.

**Property Market Analysis Platform** | Python, Pandas, Scikit-learn, Selenium
End-to-end pipeline: web scraping → ETL → ML ranking models. Optimized from 4 hours
to 15 minutes execution time through algorithmic improvements.
```

**Example for Backend Role:**
```
**Medical CRM Application** | Flask, PostgreSQL, SQLAlchemy, PythonAnywhere
Production-ready CRM with authentication, file uploads, patient management, and
session notes. Currently serving active medical practice.

**ETL + ML Pipeline Framework** | Python, YAML-driven config
Reusable framework for data extraction, feature engineering, model training, and
automated reporting. Used across 10+ personal projects.
```

---

### 4E: Education & Certifications

**Standard Format:**
```
**Ingeniero en Informática** (equiv. B.S. Computer Science)
Universidad Mayor, Chile | 2016-2020
```

**Tailoring Options:**

**Emphasize Education If:**
- Top university or relevant major
- Recent grad (< 5 years)
- Career changer showing formal training

**De-emphasize If:**
- 10+ years experience (experience speaks louder)
- Non-traditional path (self-taught)

**Certifications - Be Selective:**

Include if:
- ✅ Directly relevant to role (ML course for ML role)
- ✅ Impressive/recognizable (AWS Certified, etc.)
- ✅ Recent (< 3 years)

Skip if:
- ❌ Generic online courses everyone has
- ❌ Old/outdated technology
- ❌ Not relevant to target role

**Example for ML Role:**
```
**Certifications:**
- Machine Learning A-Z (Udemy, 2023) - Comprehensive ML fundamentals
- Pragmatic System Design (Educative, 2024) - Architecture at scale
```

---

## Step 5: Optimize for ATS (10 min)

### Use [skills-matrix.md](skills-matrix.md)

**5A: Keyword Check**

1. **Extract top 10-15 keywords** from job description
2. **Find each keyword** in skills-matrix.md to verify proficiency
3. **Ensure each keyword appears** in your CV at least once (2-3 times for critical ones)
4. **Use exact phrasing** from job description:
   - JD says "PostgreSQL" → Use "PostgreSQL" (not "Postgres")
   - JD says "RESTful APIs" → Use "RESTful APIs" (not "REST APIs")

**5B: ATS-Friendly Formatting**

✅ **DO:**
- Use standard section headers ("Professional Experience", "Skills", "Education")
- Save as PDF with text (not image)
- Use standard fonts (Arial, Calibri, Times New Roman)
- Left-align text (no fancy columns)
- Use bullet points for lists
- Include full company names and locations
- Spell out acronyms first: "Machine Learning (ML)"

❌ **DON'T:**
- Use tables for main content
- Hide text in headers/footers
- Use text boxes or graphics
- Use unusual fonts
- Rely on colors for meaning
- Use images or logos

**5C: Jobscan Test**

1. Go to [Jobscan.co](https://www.jobscan.co)
2. Paste job description
3. Upload your tailored CV
4. Review match score

**Target Scores:**
- 75%+: Good, apply
- 60-74%: Add missing critical keywords
- <60%: Significant mismatch, reconsider or heavily revise

**Common Issues:**
- Missing required skills (add if you have them!)
- Wrong terminology (fix to match JD)
- Not enough keyword repetition (include naturally 2-3x)
- Skills buried (move to prominent skills section)

---

## Step 6: Quality Check (10 min)

### Final Review Checklist

**Content:**
- [ ] Professional summary includes 3-5 top keywords from JD
- [ ] Skills section includes all required skills I possess
- [ ] Each job has 4-6 bullets aligned with role requirements
- [ ] At least 3 quantified achievements (with numbers/percentages)
- [ ] All bullets start with strong action verbs
- [ ] No generic statements ("Responsible for..." "Worked on...")
- [ ] Company names, dates, locations correct
- [ ] No typos or grammatical errors (use Grammarly)

**ATS Optimization:**
- [ ] Top 10 keywords from JD appear in CV
- [ ] Standard section headers used
- [ ] PDF format (with selectable text)
- [ ] No tables, text boxes, or graphics in main content
- [ ] Jobscan score 75%+ (if using tool)

**Strategic Positioning:**
- [ ] Emphasizes strengths from FODA analysis
- [ ] Addresses potential gaps proactively
- [ ] Tone matches company culture (formal vs casual)
- [ ] Differentiators clearly visible (mainframe+cloud, 5 years professional Python, 11 years experience, etc.)

**Formatting:**
- [ ] 1-2 pages (1 page if < 7 years experience, 2 pages if 10+ years)
- [ ] Consistent formatting (fonts, sizes, spacing)
- [ ] Adequate white space (not cramped)
- [ ] Professional appearance
- [ ] Easy to skim (recruiter spends 6 seconds)

**Final Polish:**
- [ ] Read aloud for flow
- [ ] Run spell check
- [ ] Check on different devices (formatting preserved)
- [ ] Save with clear filename: "Gabriel_Carcamo_Senior_Backend_Engineer.pdf"

---

## Common Mistakes to Avoid

### ❌ Mistake #1: Using One CV for All Applications
**Why It Fails:** Generic CVs don't match specific job requirements
**Fix:** Tailor every CV (30-60 min investment is worth it!)

### ❌ Mistake #2: Keyword Stuffing
**Example:** "Python Python Python expert in Python development using Python"
**Why It Fails:** ATS flags it, humans hate it
**Fix:** Include keywords naturally in context

### ❌ Mistake #3: Listing Responsibilities Instead of Achievements
**Bad:** "Responsible for developing backend systems"
**Good:** "Built Flask backend reducing API response time by 60%"
**Fix:** Use XYZ formula (Accomplished X measured by Y by doing Z)

### ❌ Mistake #4: Claiming Skills You Don't Have
**Why It Fails:** Exposed in technical interview
**Fix:** Be honest, use "familiar with" or "learning" for stretch skills

### ❌ Mistake #5: Walls of Text
**Why It Fails:** Recruiters won't read it
**Fix:** Bullet points, short sentences, white space

### ❌ Mistake #6: Ignoring ATS
**Why It Fails:** 75% of CVs filtered by ATS before human sees them
**Fix:** Follow ATS formatting rules, use Jobscan

### ❌ Mistake #7: Too Long or Too Short
**Bad:** 4-page CV with everything ever done
**Bad:** 1-page CV for 11 years experience
**Fix:** 2 pages for 10+ years, 1 page for < 7 years

### ❌ Mistake #8: Outdated Information
**Example:** "Proficient in Python 2.7"
**Fix:** Remove or update old tech, emphasize current skills

### ❌ Mistake #9: Passive Language
**Bad:** "Was responsible for..." "Worked on..." "Involved in..."
**Good:** "Led..." "Built..." "Optimized..."
**Fix:** Active voice, strong verbs

### ❌ Mistake #10: No Metrics
**Bad:** "Improved system performance"
**Good:** "Reduced system runtime by 94% (4 hours → 15 minutes)"
**Fix:** Quantify everything possible

---

## Time-Saving Tips

### For Each New Application:

**First Application (60 min):**
- Full analysis and tailoring
- Create role-specific template

**Subsequent Similar Roles (20 min):**
- Use previous role template
- Swap keywords for new company
- Adjust 2-3 bullets for specifics
- Run Jobscan check

**Track Applications:**
```markdown
| Date | Company | Role | CV Version | Status |
|------|---------|------|------------|--------|
| 2025-11-24 | Xmartlabs | Python Senior | v1_python_xmart | Applied |
```

**Save Tailored CVs:**
```
/cv-system/applications/
  └── 2025-11-24_Xmartlabs_Python_Senior/
      ├── Gabriel_Carcamo_Python_Senior.pdf
      ├── job_description.txt
      ├── analysis.md
      └── cover_letter.md (if needed)
```

---

## Role-Specific Quick Guides

### Backend Engineer Quick Tailoring

**Professional Summary Template:**
```
Senior Backend Engineer with [X] years building scalable server-side systems in
[languages]. Expert in [API/database/framework]. [Quantified achievement]. Passionate
about [company mission alignment].
```

**Must-Include Keywords:**
Backend, Python, API, SQL, Flask/Django, Performance, Optimization

**Bullet Focus:**
- System architecture and design
- API development
- Database optimization
- Performance improvements (quantified)
- Production system maintenance

**De-emphasize:**
- Mainframe (unless modernization role)
- Frontend work
- Non-backend projects

---

### ML Engineer Quick Tailoring

**Professional Summary Template:**
```
ML Engineer with [X] years software engineering and ML expertise. Built [type of ML
systems]. [Quantified ML achievement]. Eager to [align with company ML goals].
```

**Must-Include Keywords:**
Machine Learning, ML Pipeline, Python, Scikit-learn, Feature Engineering, Model Training

**Bullet Focus:**
- ML projects (end-to-end)
- Data processing and ETL
- Model development and evaluation
- Python expertise
- Production ML (if any)

**De-emphasize:**
- Non-ML work (unless showing software engineering discipline)
- Mainframe
- Pure application development

---

### Staff Engineer / Tech Lead Quick Tailoring

**Professional Summary Template:**
```
Staff Software Engineer with [X] years providing technical leadership across [domain].
Specialized in [architecture/systems/domain]. Coordinated [X] teams delivering
[impact]. Strong mentor and technical strategist.
```

**Must-Include Keywords:**
Technical Leadership, Architecture, System Design, Mentorship, Cross-functional

**Bullet Focus:**
- Multi-team coordination
- Architecture decisions
- Mentorship and training
- Cross-functional collaboration
- Strategic technical impact

**De-emphasize:**
- Pure implementation details
- Junior-level tasks
- Don't claim people management (unless you have it)

---

## Example: Full Tailoring Walkthrough

### Job Description: "Senior Python Engineer at Xmartlabs"

**Step 1: Analysis**

**Required Skills:**
- 5+ years Python ✅ (I have 13+)
- Flask/Django/FastAPI ✅ (Flask proficient, Django familiar)
- PostgreSQL ✅ (I have experience)
- Docker ⚠️ (Familiar, not deep)
- RESTful APIs ✅ (Strong experience)
- AWS ✅ (Lambda, EC2, S3)
- Agile ✅ (10+ years)

**Role Type:** Senior Python Engineer (from target-roles.md)

**Emphasis:** 80% Backend Python, 10% DevOps, 10% Collaboration

---

**Step 2: Positioning**

**Strengths to Emphasize:**
- Backend depth (5 years professional Python, 11 years overall experience)
- Autonomy (remote work capability)
- Production systems

**Gaps to Address:**
- Docker (familiar, learning)

**Opportunities:**
- Remote work (LATAM, timezone compatible)
- Open source culture (mention GitHub projects)

---

**Step 3: Content Selection**

**Professional Summary:**
```
Senior Python Engineer with 13+ years building production backend systems for
financial services and data-intensive applications. Expert in Flask, PostgreSQL,
RESTful APIs, and AWS deployment. Reduced system runtime by 94% through algorithmic
optimization. Passionate about clean code, mentorship, and open-source collaboration.
```

**Skills:**
```
**Languages:** Python (13+ years), SQL, C, Shell (Bash)
**Backend:** Flask, Django (familiar), RESTful APIs, FastAPI (learning)
**Data:** Pandas, NumPy, ETL Pipelines, PostgreSQL, MySQL
**Cloud & DevOps:** AWS (Lambda, EC2, S3), Docker (familiar), Git, CI/CD
**Methodologies:** Agile, Scrum, Code Review, Unit Testing
```

**Top Bullets (Experian 2020-2025):**
```
• Developed production-grade Python automation frameworks for cross-platform model
  validation, reducing QA time by 70% and eliminating manual testing errors

• Built Flask-based CRM application with PostgreSQL backend, SQLAlchemy ORM, secure
  authentication, and file upload system serving active medical practice

• Architected ETL pipeline reducing execution time from 4+ hours to 15 minutes
  through dependency graph analysis and optimized aggregation strategies

• Collaborated with data science teams to design and implement Python-based credit
  risk models deployed on AWS (Lambda, S3), serving major financial institutions
```

---

**Step 4: ATS Check**

**Keywords in CV:**
- ✅ Python (4 times)
- ✅ Flask (2 times)
- ✅ PostgreSQL (2 times)
- ✅ RESTful API (1 time)
- ✅ AWS (2 times)
- ✅ Docker (1 time, marked "familiar")
- ✅ Agile (1 time)

**Jobscan Score:** 78% ✅

---

**Step 5: Quality Check**
- ✅ All checklist items reviewed
- ✅ Spell-checked
- ✅ Saved as: Gabriel_Carcamo_Senior_Python_Xmartlabs.pdf

---

## Document Metadata

- **Version:** 1.0
- **Last Updated:** 2025-11-24
- **Purpose:** Systematic CV tailoring process
- **Time Investment:** 30-60 min per application (WORTH IT!)
- **Related Documents:**
  - [master-cv.md](master-cv.md) - Source content
  - [target-roles.md](target-roles.md) - Role strategies
  - [foda-analysis.md](foda-analysis.md) - Positioning
  - [skills-matrix.md](skills-matrix.md) - Keywords
  - [success-stories.md](success-stories.md) - STAR examples
