# Systems Navigator (working title) - Spec

## One-liner
An advocate in your pocket for confusing public and health systems: it explains letters and bills in plain language, tells you the next step, and helps you prepare for calls and visits.

## Who it's for
People overwhelmed by systems that are hard to read: low health literacy, language barriers, disabilities, stress, caregivers, people new to a system. Never frame users as incompetent or lazy, in copy, marketing or prompts.

## Wedge (pick one to launch)
One system in one place first, e.g. Medicaid + SNAP renewals in a single city. Excellent at one flow beats mediocre at everything.

## Core features
MVP
1. **Scan & explain:** photograph/upload a letter, bill, denial or EOB -> plain-language summary, what it means, deadline, what to do.
2. **Next-step checklist:** auto-built task list with due dates and reminders.
3. **Call/visit prep:** short script, documents to bring, questions to ask, what to write down during the call.
4. **Document vault:** on-device, encrypted.
5. **Voice-first and multilingual:** read-aloud, speak-to-ask, language switch on every screen.

Later
6. Helper mode (caregiver/case worker shared task lists, user-controlled)
7. "Hold for me": waits on hold and alerts the user when a human answers (legal review first)
8. Official resource directory (211, patient advocates, legal aid, local benefit offices)

## UX principles (native, mobile-first)
- Hick's: max 3 choices on the home screen (Scan something / My tasks / Get help)
- Miller's + Tesler's: break every task into <=5 steps; the app absorbs complexity, not the user
- Fitts's: large bottom-aligned thumb targets, 48pt minimum
- Doherty: respond <400 ms; show progress while the model is working
- Zeigarnik: show unfinished tasks on top with a clear "pick up where you left off"
- Peak-end: finish every task with "you're done, here's what happens next"
- Postel's: accept messy photos, partial info and any language; be strict in what the app outputs
- Jakob's: familiar patterns (camera button, checklist, inbox)
- Occam's: the fewest screens that work
- Reading level: around grade 6; offer a "simpler" button

## Tech
- Expo / React Native (TypeScript), Expo Router, one codebase for iOS and Android
- On-device storage: SQLite (encrypted) + file system for scans; keys in expo-secure-store
- Camera + OCR: expo-camera/image-picker, vision-capable model via a thin backend proxy; no model API keys in the app
- Backend proxy (Supabase Edge Function / Cloudflare Worker): authenticates, rate limits, strips identifiers, forwards to the model; no document storage by default
- Voice: expo-speech or ElevenLabs TTS through the proxy; speech-to-text through OS or Scribe via proxy
- Notifications: expo-notifications for deadlines
- Auth: Sign in with Apple/Google + optional passcode/biometric lock

## Privacy approach
Data stays on-device by default; the backend processes and forgets. Tell users exactly what leaves the device. Provide export and delete-all.

## Success metrics
Time from scan to "I know what to do", % of scanned letters leading to a completed task, self-reported deadline misses, 7-day return rate, user-reported confidence (1-5 after each task).

## Out of scope for MVP
Medical or legal advice, diagnosis, filling forms with government credentials, calling agencies on the user's behalf.

---
# Advocate scope (added)

Goal: a fully capable "advocate for confusing systems" - not just a letter explainer. See `docs/ADVOCATE-ARCHITECTURE.md`.

## Launch situations (NYC)
1. **Eviction warnings and court papers** - classify the paper, set urgency and deadlines, connect to free legal help, prepare a call/voicemail script and document list. Playbook: `playbooks/nyc-eviction.md`
2. **Utility shutoff and restoration (Con Edison)** - payment-agreement call script and letter, medical-emergency pathway, restoration steps, PSC complaint route. Playbook: `playbooks/nyc-utility-shutoff-coned.md`
3. **"Who do I call?"** - verified directory lookup for any situation (`directory/nyc-directory.json`)

## Capability layers
- Playbooks (reviewed, versioned) + verified directory (sourced, dated) + triage/clocks + action tools (scripts, letters, reminders)
- Rule: the model never states a phone number, address, deadline rule or eligibility threshold that is not in a playbook or directory entry. Directory entries with no `verified_on` date, or older than 180 days, are hidden from the assistant.
- Escalation: court deadlines, warrants, marshal's notices, lockouts and medical-power emergencies go straight to the emergency branch (same-day action, free legal help first).

## Next systems (in order)
SNAP/cash assistance renewals, Medicaid/insurance denials and appeals, NYCHA, DMV/ID, school/IEP processes.
