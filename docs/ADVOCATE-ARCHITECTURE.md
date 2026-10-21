# Making it a fully capable advocate

"Fully capable" does not mean the model improvises. It means the app combines four things the model alone cannot do reliably:

1. **Playbooks** - versioned, human-reviewed step-by-step guides for specific situations (eviction notice, utility shutoff, etc.). The model picks and personalizes a playbook; it does not invent the process.
2. **Verified directory** - every phone number, address, URL and eligibility threshold lives in a reviewed data file with a source URL and `verified_on` date. The model may only quote contacts returned by the directory tool. If it is not in the directory, the app says so and points to 311 / 211.
3. **Triage and clocks** - a classifier labels the document or situation (e.g. rent demand vs. petition vs. warrant vs. marshal's notice), assigns urgency, and starts a countdown from the dates it finds. Urgent items jump to the top.
4. **Action tools** - drafting letters and scripts, building a "what to bring" list, setting reminders, and (later) placing or waiting on calls.

## Request flow
user input (photo / text / voice)
-> OCR + extraction (sender, document type, dates, amounts, case/account numbers)
-> triage (situation, urgency, deadline)
-> playbook selection (by situation + jurisdiction)
-> directory lookup (verified contacts only)
-> response in the six-section format + task list + call script / letter draft
-> reminders and follow-up check-ins

## Information, not legal advice
The app gives legal *information* (what the notice is, what the process generally is, what rights programs exist, who to call) and helps prepare. It does not predict case outcomes, tell users to withhold rent, or represent them. For anything with a court date or warrant it routes to free legal help first.

## Freshness
- Each directory entry and playbook has `verified_on`. The app shows "last checked <date>" on contact cards.
- A weekly job re-fetches each source URL, hashes the page, and flags changes for human review. Entries older than 90 days get a warning badge in the admin view; older than 180 days are hidden from the assistant until re-verified.
- Thresholds that change yearly (income limits) are stored as data with an effective date.

## Evaluation (do this before launch)
Build a golden set of 40+ realistic notices and situations (photographed, messy, in Spanish and English). For each: expected situation label, urgency, correct contacts, forbidden claims. Run on every prompt/playbook change. Any invented phone number or deadline is a release blocker.

## Expansion order after NYC housing + utilities
SNAP/cash assistance renewals, Medicaid/insurance denials and appeals, NYCHA issues, DMV/ID, school/IEP processes, immigration-adjacent services (resource referral only, route to accredited representatives).
