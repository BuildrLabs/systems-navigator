# Systems Navigator Package (working title)

Native mobile app: an advocate for confusing public and health systems. It explains letters and notices, tells the user what to do next and by when, finds the right (verified) contacts, and drafts scripts and letters. First launch scope: NYC eviction warnings/court papers and Con Edison shutoff/restoration.

Build with: Claude Code + Expo/React Native (iOS and Android).

## Files
- `SPEC.md` - product scope, wedge, UX principles, tech, metrics, advocate scope (start here)
- `docs/ADVOCATE-ARCHITECTURE.md` - how "fully capable" works: playbooks, verified directory, triage, tools, evaluation
- `playbooks/` - `nyc-eviction.md`, `nyc-utility-shutoff-coned.md`, format guide
- `directory/nyc-directory.json` - sourced, dated contacts (entries with no verified date are hidden until verified)
- `templates/` - Con Edison payment-agreement letter, legal-help intake notes
- `assistant-system-prompt.md` - the assistant's prompt, incl. advocate addendum
- `schema.sql` - on-device SQLite schema (incl. playbook runs, deadlines, drafts, directory cache)
- `build-prompts.md` - Prompts 1-8 (app) and 9-14 (advocate layer)
- `safety-privacy-checklist.md` - working checklist (not legal advice)
- `CLAUDE.md` - project rules file for the repo root

## Use
1. Create an empty repo, add `CLAUDE.md`, copy in the other files.
2. Paste Prompts 1-8 into Claude Code in order, then 9-14.
3. Before launch: have a tenant attorney/advocate review both playbooks, resolve every VERIFY item, confirm the two "secondary" directory entries on the official sites, and run the evaluation set.
4. Test with 5-10 people from the target group.

Never put model API keys in the app; all model calls go through the backend proxy.
