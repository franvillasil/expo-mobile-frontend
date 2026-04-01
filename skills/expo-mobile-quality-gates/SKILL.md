---
name: expo-mobile-quality-gates
description: Run final quality passes for Expo and React Native features across accessibility, hardening, text overflow, i18n, performance, device QA, and React diagnostics. Use when a feature is nearly done, before merging, before release, or when a mobile UI feels correct but unproven.
---

# Expo Mobile Quality Gates

Use this skill before calling a feature done. It is the quality pass that catches the issues users notice first: broken states, missing feedback, long text, keyboard collisions, jank, and untested device behavior.

## Default Pass Order

1. Functional state coverage: loading, empty, error, success, retry.
2. Layout resilience: small screens, long strings, safe areas, keyboard overlap.
3. Accessibility: labels, focus, touch targets, contrast, reduced motion.
4. Performance: render cost, image choices, animation smoothness, list behavior.
5. Verification: tests, emulator or simulator QA, and React diagnostics.

Read [review-checklist.md](references/review-checklist.md) for the full shipping checklist.

## Required Checks

- Test the feature with real or simulated slow network.
- Check text overflow with longer strings and larger system text.
- Verify one-handed and thumb-zone interactions for primary actions.
- Confirm error states provide recovery, not just failure messaging.
- Run `react-doctor` after meaningful React changes if the environment supports it.

## Anti-Patterns

- Declaring a feature done after only testing the happy path.
- Assuming web layout checks are enough for mobile safe areas and keyboard behavior.
- Ignoring reduced motion, screen reader labels, or large-text settings.
- Treating one simulator snapshot as sufficient QA.
- Skipping performance checks because the code looks simple.

## Output Checklist

- Happy path and recovery paths are both proven.
- Layout survives realistic content and device constraints.
- Accessibility basics are present and deliberate.
- Performance issues are either fixed or explicitly called out.
- Remaining risks are written down if they were not addressed.

## References

- `references/review-checklist.md` for final QA, accessibility, and performance checks.

**Note:** Scripts may be executed without loading into context, but can still be read by Codex for patching or environment adjustments.

### references/
Documentation and reference material intended to be loaded into context to inform Codex's process and thinking.

**Examples from other skills:**
- Product management: `communication.md`, `context_building.md` - detailed workflow guides
- BigQuery: API reference documentation and query examples
- Finance: Schema documentation, company policies

**Appropriate for:** In-depth documentation, API references, database schemas, comprehensive guides, or any detailed information that Codex should reference while working.

### assets/
Files not intended to be loaded into context, but rather used within the output Codex produces.

**Examples from other skills:**
- Brand styling: PowerPoint template files (.pptx), logo files
- Frontend builder: HTML/React boilerplate project directories
- Typography: Font files (.ttf, .woff2)

**Appropriate for:** Templates, boilerplate code, document templates, images, icons, fonts, or any files meant to be copied or used in the final output.

---

**Not every skill requires all three types of resources.**
