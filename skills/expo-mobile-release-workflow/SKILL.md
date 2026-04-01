---
name: expo-mobile-release-workflow
description: Guide Expo and React Native release work across Expo Dev Client, EAS build and submit flows, CI, SDK upgrades, dependency hygiene, and rollback readiness. Use when preparing previews or production builds, updating Expo SDK versions, configuring EAS, or hardening release discipline for a mobile app.
---

# Expo Mobile Release Workflow

Use this skill when release work becomes a product risk rather than a local coding task. It is for SDK upgrades, build profiles, preview discipline, production readiness, and rollback planning.

## Default Decisions

- Prefer stable Expo and React Native dependencies unless the user explicitly accepts preview risk.
- Keep separate development, preview, and production build profiles.
- Validate the local app before trusting a cloud build.
- Upgrade Expo one major SDK step at a time.
- Treat release notes, rollback strategy, and smoke checks as part of the feature, not as afterthoughts.

## Release Workflow

1. Confirm the target: dev client, preview, production, or upgrade.
2. Validate local typecheck, lint, and critical runtime flows first.
3. Confirm EAS profile, secrets, and native config alignment.
4. Build and verify the right artifact for the target audience.
5. Capture rollback and post-release verification steps before shipping.

Read [build-and-upgrade.md](references/build-and-upgrade.md) for the default build matrix and upgrade playbook.

## Anti-Patterns

- Mixing preview and production settings in the same build profile.
- Upgrading Expo plus unrelated major libraries in one blind jump.
- Assuming successful cloud build means successful runtime behavior.
- Releasing without smoke checks on authentication, navigation, and primary conversion flows.
- Forgetting rollback paths or OTA targeting rules.

## Output Checklist

- Release target and environment are explicit.
- Build profiles and secrets match the intended release.
- Upgrade work has a migration path and a rollback path.
- Smoke checks are identified for the shipped surface.
- Release notes or change summary exist for the team.

## References

- `references/build-and-upgrade.md` for build profile discipline and upgrade sequencing.

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
