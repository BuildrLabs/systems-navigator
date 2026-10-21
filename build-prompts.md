# Build prompts (Claude Code, in an empty repo with CLAUDE.md in place)

## Prompt 1 - Scaffold
Create an Expo (TypeScript) app with Expo Router. Set up tabs: Home, Tasks, Vault, Help. Home shows exactly three large buttons: "Scan something", "My tasks", "Get help". Add theme tokens with large type, high contrast, 48pt+ touch targets, and a global language switcher. Add dark mode. Commit.

## Prompt 2 - Local data layer
Set up expo-sqlite with the schema in schema.sql, migrations, and a typed data-access module. Store the encryption key in expo-secure-store. Add optional biometric/passcode lock on app open. Add unit tests for the data layer.

## Prompt 3 - Proxy backend
Create a small backend proxy (Supabase Edge Function or Cloudflare Worker) with one endpoint: POST /explain. It accepts an image or text plus language, authenticates the user, rate limits, strips metadata, calls the model with assistant-system-prompt.md, and returns structured JSON: {what_this_is, what_it_says[], steps[], deadline, bring[], help[]}. It must not log or store document content. API keys come from server secrets only.

## Prompt 4 - Scan & explain
Implement the Scan flow: camera or photo picker -> crop -> send to /explain with a progress state under 400 ms to first feedback -> show the result in the six-section format with a "Make it simpler" button and read-aloud. "Save as tasks" converts steps into tasks with due dates. Save the document and file locally.

## Prompt 5 - Tasks and reminders
Build the Tasks screen: unfinished tasks on top ("Pick up where you left off"), max 5 steps per task, mark-done animation, completion screen that explains what happens next. Schedule local notifications 7, 3 and 1 day before due dates.

## Prompt 6 - Call/visit prep
For any task, "Prepare me" generates a short script, a bring-list and questions, plus a large-text notes field. Add a one-tap "I called, here's what they said" that turns notes into a follow-up task.

## Prompt 7 - Voice and languages
Add speech-to-text input and read-aloud on every result. Add Spanish first (then further languages), including UI strings and model output language.

## Prompt 8 - Privacy and release
Add an in-app "What leaves your phone" screen, export-all and delete-all. Prepare App Store/Play listings with accurate data-safety declarations, a privacy policy and a crisis-resource note. Run the safety checklist.

---
# Advocate build prompts (after Prompts 1-8 work end to end)

## Prompt 9 - Directory service
Implement a `lookup_directory(situation, jurisdiction)` module backed by directory/nyc-directory.json (synced into the directory_cache table). Return only entries with a verified_on date within 180 days. Include source_urls and verified_on in every result. The assistant proxy must expose this as a tool and the model must be unable to output contacts that were not returned by it (post-process: strip or flag any phone number/URL in the model output that is not in the tool results). Add unit tests for the stripping logic.

## Prompt 10 - Playbook engine
Load markdown playbooks from /playbooks. Implement triage: given extracted document fields, choose the situation label, urgency and playbook. Render the playbook as a task list with deadlines, resolving `dir:<id>` references through the directory service. Emergency urgency pins the task to the top of Home and adds a banner with the first same-day action. Respect "VERIFY" markers: facts under VERIFY sections are never shown as facts.

## Prompt 11 - Deadlines and clocks
Extract dates from documents (response deadline, court date, termination date, pay-by date) into the deadlines table with the source document. Show a countdown on the task and schedule reminders at 7/3/1 days and on the day. Add a "what changed?" prompt when the user uploads a follow-up document for the same case.

## Prompt 12 - Scripts and letters
Add "Prepare me" for the eviction and Con Edison playbooks: fill the call script and voicemail script with the user's details, produce the bring-list, and generate drafts from templates/. Drafts are editable, copy/share only (no auto-send). Add a call-notes screen that logs the representative's name, reference number and what was promised, and creates a follow-up task.

## Prompt 13 - Evaluation harness
Create /eval with a golden set of 40+ cases (photos or extracted text; English and Spanish; messy scans) covering every situation label in both playbooks. Each case lists expected label, urgency, required directory ids and forbidden claims. Run the harness in CI on every change to prompts, playbooks or the directory. Fail the build on: invented contacts, missing emergency escalation, outcome predictions, or stating VERIFY items as fact.

## Prompt 14 - Directory freshness job
Add a weekly script that fetches each source_urls page, stores a hash, and writes a report of changed pages and entries older than 90 days for human review. Entries with verified_on null stay hidden. Add an admin screen (or CLI) to mark an entry verified with the date and reviewer.
