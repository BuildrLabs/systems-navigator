# Safety and privacy checklist (not legal advice)

## Health data and privacy
- [ ] Decide whether you are a HIPAA covered entity/business associate (usually not for a consumer app) - confirm with counsel
- [ ] FTC Health Breach Notification Rule and state health-data laws (e.g. Washington My Health My Data) reviewed
- [ ] Data stays on-device by default; backend does not store documents or prompts
- [ ] Model provider's data-retention terms reviewed; zero-retention option chosen if available
- [ ] Encrypt local data; biometric lock option; delete-all and export-all work
- [ ] App Store/Play privacy labels match actual behavior
- [ ] No third-party analytics SDKs that read document content; minimal analytics, no PII

## Content safety
- [ ] No diagnosis, treatment, or legal-outcome predictions (tested with adversarial prompts)
- [ ] Emergency/crisis handling tested (911 / 988 flow)
- [ ] Scam-detection behavior tested
- [ ] Hallucination guardrails: exact quoting of numbers/dates; "unclear photo" fallback
- [ ] Local resources sourced from verified directories (211), not generated

## Accessibility
- [ ] Screen reader labels, dynamic type, contrast checked
- [ ] Read-aloud and voice input on every result
- [ ] Reading-level check on outputs; "simpler" mode works
- [ ] Languages reviewed by native speakers

## Testing with real people
- [ ] Test with 5-10 people from the target group before launch
- [ ] Measure scan-to-"I know what to do" time and confidence rating

## If you add "Hold for me" or agent calls later
- [ ] Recording-consent laws, impersonation rules and each agency's policies reviewed first
