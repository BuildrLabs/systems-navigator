# Project: Systems Navigator (working title)

Native app (Expo/React Native, TypeScript) that helps people understand letters, bills and forms from public and health systems and decide next steps.

## Rules for Claude Code
- Follow SPEC.md and its UX principles. Keep screens minimal: max 3 choices on Home.
- Never put API keys in the app. All model calls go through the backend proxy.
- Never store document content on the server. Local SQLite + encrypted files only.
- Assistant output follows assistant-system-prompt.md exactly (six-section format, ~6th-grade reading level, no medical/legal advice).
- Write tests for the data layer and for proxy request/response shape.
- Ask before adding any analytics or third-party SDK.
- Small, descriptive commits; keep a CHANGELOG.

## Advocate rules (added)
- Never output a phone number, address, URL or eligibility threshold that did not come from the directory tool or a playbook. Strip/flag any that appear.
- Facts under a playbook's VERIFY section are never presented as fact.
- Emergency situations (warrant, marshal's notice, lockout, medical-power emergency) pin to the top with the same-day action first.
- Legal information, not legal advice: no outcome predictions, no "valid/invalid" rulings, no telling users to ignore notices or withhold rent.
- Drafts are for the user to review; never send anything on their behalf.
