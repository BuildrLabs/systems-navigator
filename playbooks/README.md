# Playbook format

Each playbook is a markdown file with these sections, reviewed by a human (ideally a tenant lawyer / advocate) before it ships:

- Situation: how the user knows they are in it
- Document types it covers and how to tell them apart
- Urgency rules (what is an emergency)
- Steps the user can do in one sitting each
- Who to call (reference directory ids only, never raw numbers)
- What to say on the call (script)
- What to bring
- Do / Don't
- Things the app must not say
- VERIFY BEFORE LAUNCH: facts still needing primary-source confirmation

Contacts are referenced as `dir:<id>` and resolved from `directory/nyc-directory.json` at runtime.
