---
name: expo-mobile-ui-system
description: Build and normalize Expo and React Native UI systems with NativeWind or Tailwind-style tokens, theming, reusable primitives, and predictable component composition. Use when creating screens, extracting shared UI, defining tokens, migrating from ad-hoc styles, or reviewing visual consistency in a mobile frontend.
---

# Expo Mobile UI System

Use this skill to keep mobile UI work intentional rather than ad hoc. Prefer tokens, reusable primitives, and composition patterns over one-off class strings or per-screen styling inventions.

## Default Decisions

- Prefer NativeWind or an equivalent Tailwind-flavored setup for new Expo UI work.
- Define tokens before building more surface area.
- Build primitives first: text, button, input, card, sheet, badge, section header.
- Normalize spacing, radius, color, and typography through tokens rather than repeated literals.
- Respect an existing design system if the repo already has one.

## Working Rules

1. Start by finding or defining tokens.
2. Map those tokens into wrappers or shared primitives.
3. Build screens from primitives and feature components, not raw `View` trees everywhere.
4. Keep visual language consistent across loading, empty, error, and success states.
5. When extracting a reusable component, make the API read like product language, not CSS language.

Read [tokens-and-composition.md](references/tokens-and-composition.md) for the default token model and composition rules.

## Anti-Patterns

- Hardcoding colors, spacing, or radii in multiple files.
- Shipping screens built from raw primitives with no reusable layer.
- Mixing multiple styling approaches in the same feature without a reason.
- Extracting a shared component before its API is stable.
- Treating Tailwind classes as the design system instead of as an implementation detail.

## Output Checklist

- Tokens exist for the new visual language you introduced.
- Shared primitives are reused where appropriate.
- The screen still reads cleanly without scanning long style strings.
- Loading, empty, and error states match the same visual system.
- The UI respects safe areas, keyboard behavior, and long-content cases.

## References

- `references/tokens-and-composition.md` for token buckets, theming, and primitive design.

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
