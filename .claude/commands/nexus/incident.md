PRODUCTION INCIDENT — activate incident response immediately.

Incident description: $ARGUMENTS

Step 1 — Infrastructure Maintainer: assess scope, classify severity (P0/P1/P2/P3), activate response team.

P0/P1 response team:
- Infrastructure Maintainer (commander)
- DevOps Automator (rollback/deployment)
- Backend Architect (root cause investigation)
- Support Responder (status page, user comms every 15 min)
- Executive Summary Generator (stakeholder updates — P0 only)

Decision tree:
- Recent deployment → rollback first
- Infrastructure issue → scale/restart/failover
- Code bug → hotfix → Evidence Collector verifies → deploy
- External dependency → activate fallback, communicate to users

After resolution: Evidence Collector confirms fix, Infrastructure Maintainer monitors 30 min.
Within 48h: Workflow Optimizer leads post-mortem with 5 Whys analysis.
