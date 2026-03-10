# NEXUS Commands Installer for Claude Code (Windows)
# Run this script in PowerShell as your normal user (no admin needed)
# Usage: .\install-nexus-commands.ps1

$commandsDir = "$env:USERPROFILE\.claude\commands"

if (-not (Test-Path $commandsDir)) {
    New-Item -ItemType Directory -Path $commandsDir -Force | Out-Null
    Write-Host "Created: $commandsDir"
}

$commands = @{
    "nexus-full.md" = @"
Activate Agents Orchestrator in NEXUS-Full mode.

Project: `$ARGUMENTS

Execute the complete NEXUS pipeline:
- Phase 0: Discovery (Trend Researcher, Feedback Synthesizer, UX Researcher, Analytics Reporter, Legal Compliance Checker, Tool Evaluator)
- Phase 1: Strategy (Studio Producer, Senior Project Manager, Sprint Prioritizer, UX Architect, Brand Guardian, Backend Architect, Finance Tracker)
- Phase 2: Foundation (DevOps Automator, Frontend Developer, Backend Architect, UX Architect, Infrastructure Maintainer)
- Phase 3: Build (Dev↔QA loops — all engineering + Evidence Collector)
- Phase 4: Harden (Reality Checker, Performance Benchmarker, API Tester, Legal Compliance Checker)
- Phase 5: Launch (Growth Hacker, Content Creator, all marketing agents, DevOps Automator)
- Phase 6: Operate (Analytics Reporter, Infrastructure Maintainer, Support Responder, ongoing)

Quality gates between every phase. Evidence required for all assessments.
Maximum 3 retries per task before escalation.
"@

    "nexus-sprint.md" = @"
Activate Agents Orchestrator in NEXUS-Sprint mode.

Feature/MVP: `$ARGUMENTS

Sprint team:
- PM: Senior Project Manager, Sprint Prioritizer
- Design: UX Architect, Brand Guardian
- Engineering: Frontend Developer, Backend Architect, DevOps Automator
- QA: Evidence Collector, Reality Checker, API Tester
- Support: Analytics Reporter

Begin at Phase 1 with architecture and sprint planning.
Run Dev↔QA loops for all implementation tasks.
Reality Checker approval required before launch.
"@

    "nexus-mvp.md" = @"
Build startup MVP using NEXUS-Sprint runbook.

Product: `$ARGUMENTS

Agent roster:
- Core: Agents Orchestrator, Senior Project Manager, Sprint Prioritizer, UX Architect, Frontend Developer, Backend Architect, DevOps Automator, Evidence Collector, Reality Checker
- Growth (Week 3+): Growth Hacker, Content Creator, Social Media Strategist
- Support: Brand Guardian, Analytics Reporter, Performance Benchmarker, Infrastructure Maintainer

Week-by-week plan:
- Week 1: Compressed discovery + architecture (Senior Project Manager converts spec to tasks, Backend Architect defines schema, DevOps sets up CI/CD)
- Week 2-3: Dev↔QA loop sprints (Growth Hacker designs viral mechanics in Week 3)
- Week 4: Hardening + Reality Checker gate
- Week 5-6: Launch + optimize

Quality gate: Reality Checker must approve before any production deployment.
Target: live product with real users in <= 6 weeks.
"@

    "nexus-enterprise.md" = @"
Build enterprise feature using NEXUS-Sprint runbook (6-12 weeks).

Feature: `$ARGUMENTS

Core team: Agents Orchestrator, Project Shepherd, Senior Project Manager, Sprint Prioritizer, UX Architect, UX Researcher, UI Designer, Frontend Developer, Backend Architect, Senior Developer, DevOps Automator, Evidence Collector, API Tester, Reality Checker, Performance Benchmarker.
Compliance: Legal Compliance Checker, Brand Guardian, Finance Tracker, Executive Summary Generator.

Execution:
- Week 1-2: Stakeholder alignment + technical architecture (Legal Compliance from Day 1)
- Week 3: Foundation (feature flags, scaffolding, staging env)
- Week 4-9: Dev↔QA loop sprints (bi-weekly stakeholder updates via Executive Summary Generator)
- Week 10-11: Hardening (10x load test, compliance audit, Reality Checker gate)
- Week 12: Canary rollout 5% -> 25% -> 100%

Quality thresholds: code coverage >80%, API P95 <200ms, WCAG 2.1 AA, zero critical vulnerabilities.
"@

    "nexus-incident.md" = @"
PRODUCTION INCIDENT — activate incident response immediately.

Incident description: `$ARGUMENTS

Step 1 — Infrastructure Maintainer: assess scope, classify severity (P0/P1/P2/P3), activate response team.

P0/P1 response team:
- Infrastructure Maintainer (commander)
- DevOps Automator (rollback/deployment)
- Backend Architect (root cause investigation)
- Support Responder (status page, user comms every 15 min)
- Executive Summary Generator (stakeholder updates — P0 only)

Decision tree:
- Recent deployment -> rollback first
- Infrastructure issue -> scale/restart/failover
- Code bug -> hotfix -> Evidence Collector verifies -> deploy
- External dependency -> activate fallback, communicate to users

After resolution: Evidence Collector confirms fix, Infrastructure Maintainer monitors 30 min.
Within 48h: Workflow Optimizer leads post-mortem with 5 Whys analysis.
"@

    "nexus-micro-bugfix.md" = @"
Fix the following bug: `$ARGUMENTS

Activate Backend Architect to investigate and implement the fix.
After fix, activate API Tester to verify the fix with regression tests.
Then activate Evidence Collector to confirm no visual regressions.

Dev↔QA loop: maximum 3 retries before escalation to Senior Developer.
"@

    "nexus-micro-campaign.md" = @"
Activate Social Media Strategist as campaign lead.

Campaign: `$ARGUMENTS

Team:
- Content Creator — copy and content production
- Twitter Engager — Twitter/X strategy and threads
- Instagram Curator — visual content and stories
- Reddit Community Builder — community engagement

Rules:
- Brand Guardian reviews ALL content before publishing
- Analytics Reporter tracks performance daily
- Growth Hacker optimizes channels weekly

Start with campaign brief, then content calendar, then execution.
"@

    "nexus-micro-compliance.md" = @"
Activate Legal Compliance Checker for comprehensive compliance audit.

Scope: `$ARGUMENTS

Audit areas:
- Data privacy (GDPR / CCPA / HIPAA — as applicable)
- Cookie consent and tracking
- Terms of Service and Privacy Policy adequacy
- Data retention policies
- Third-party integrations compliance

After audit, activate Executive Summary Generator to create stakeholder report with:
- Findings by severity (Critical / High / Medium / Low)
- Remediation actions with deadlines
- Risk exposure assessment
"@

    "nexus-micro-performance.md" = @"
Activate Performance Benchmarker to diagnose performance issues.

Scope: `$ARGUMENTS

Investigate:
- API response times (P50, P95, P99)
- Page load / Core Web Vitals
- Database queries (slow query log)
- Memory and CPU utilization

After diagnosis, activate Infrastructure Maintainer for optimization recommendations.
DevOps Automator deploys any infrastructure changes.

Deliver: diagnosis report + action items with priority ranking.
"@

    "nexus-micro-research.md" = @"
Activate Trend Researcher for market intelligence.

Domain: `$ARGUMENTS

Deliverables:
- Competitive landscape (top 5-10 players, positioning, pricing)
- Market sizing (TAM / SAM / SOM)
- Trend forecast (3-6 month horizon)
- Key opportunities and threats

After research, activate Executive Summary Generator to create executive brief (McKinsey SCQA format, max 500 words).
"@

    "nexus-micro-ux.md" = @"
Activate UX Researcher to identify usability issues.

Feature/Product: `$ARGUMENTS

Research scope:
- User journey mapping
- Pain points and friction analysis
- Heuristic evaluation (Nielsen's 10)
- Accessibility barriers (WCAG 2.1 AA)

After research, activate UX Architect to design improvements.
Frontend Developer implements approved changes.
Evidence Collector verifies improvements with before/after screenshots.
"@
}

foreach ($file in $commands.Keys) {
    $path = Join-Path $commandsDir $file
    Set-Content -Path $path -Value $commands[$file] -Encoding UTF8
    Write-Host "OK: $file"
}

Write-Host ""
Write-Host "Gotowe! Zainstalowano $($commands.Count) komend NEXUS."
Write-Host "Zrestartuj Claude Code i uzyj /nexus-full, /nexus-sprint itp."
