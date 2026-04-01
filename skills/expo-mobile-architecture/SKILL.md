---
name: expo-mobile-architecture
description: Plan and review Expo and React Native app structure, route layout, feature boundaries, TypeScript ownership, state placement, and form or service layering. Use when scaffolding routes, choosing where new files belong, splitting responsibilities across folders, introducing stores or services, or refactoring a mobile codebase toward a cleaner architecture.
---

# Expo Mobile Architecture

Use this skill before creating or moving files. Prefer structural decisions that reduce ambiguity, keep feature ownership obvious, and match the current repo unless the user explicitly wants a broader migration.

## Default Decisions

- Prefer Expo Router for app-level navigation in new Expo projects.
- Prefer TypeScript-first files for all new logic and UI.
- Prefer feature ownership over giant `components/` or `utils/` buckets.
- Keep API clients, stores, and form schemas out of leaf UI files.
- Preserve an existing architecture if the repo already has a clear, working pattern.

## Recommended Shape

- `app/` for route files, layouts, and navigation groups.
- `src/features/<feature>/` for feature-owned UI, hooks, services, and local schemas.
- `src/components/ui/` for shared primitives used across multiple features.
- `src/lib/` for app-wide infrastructure such as API clients, storage, analytics, and query clients.
- `src/stores/` only for truly shared state; do not create a global store for local screen state.
- `src/types/` or feature-local `types.ts` for stable shared types.

Read [default-structure.md](references/default-structure.md) for the default file map and placement rules.

## Decision Rules

1. Start with the route or screen that owns the behavior.
2. Keep feature-specific UI and hooks inside that feature until at least two unrelated callers need them.
3. Extract shared primitives only when the API is stable and naming is obvious.
4. Put side effects in services, not inside presentation components.
5. Keep validation schemas near the form or request boundary they protect.

## Anti-Patterns

- Creating global folders before there is shared behavior.
- Mixing route concerns, domain logic, and data mutations in a single screen file.
- Putting every hook in `src/hooks/` regardless of ownership.
- Creating multiple sources of truth for session, theme, or query cache state.
- Refactoring to a new architecture without preserving the repo's current conventions.

## Output Checklist

- Folder ownership is obvious from the tree.
- Each new file has a single reason to exist.
- Shared state is justified, not assumed.
- Route boundaries, feature boundaries, and infra boundaries are clear.
- New code follows the repo's current conventions unless the user requested migration.

## References

- `references/default-structure.md` for the default route and feature layout.

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
