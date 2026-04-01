---
name: expo-mobile-data-runtime
description: Design Expo and React Native data flows with TanStack Query, typed service layers, auth-aware requests, mutations, retries, and predictable error boundaries. Use when wiring APIs, cache, invalidation, optimistic UI, forms, request cancellation, or offline-aware mobile runtime behavior.
---

# Expo Mobile Data Runtime

Use this skill when network behavior or app state can affect user trust. Prefer explicit data ownership, typed boundaries, and predictable loading or error models over ad hoc fetches inside components.

## Default Decisions

- Prefer TanStack Query for server state in new Expo projects.
- Keep a thin service layer between UI and transport details.
- Treat auth, retries, and invalidation as first-class concerns.
- Validate untrusted data at the boundary if the project already uses schemas.
- Keep local UI state separate from server cache state.

## Runtime Rules

1. Queries own reads. Mutations own writes.
2. Derive loading and error states from one source of truth.
3. Put request logic in services or query hooks, not screen bodies.
4. Use explicit cache keys and invalidation targets.
5. Cancel or ignore stale requests when screen focus changes or inputs are replaced.

Read [query-and-error-patterns.md](references/query-and-error-patterns.md) for default query shapes, mutation behavior, and error handling expectations.

## Anti-Patterns

- Raw `fetch` calls spread across multiple components.
- Mixing optimistic UI, local state, and cache writes without ownership rules.
- Reusing one error state for unrelated requests.
- Hiding auth refresh or token logic inside random UI hooks.
- Treating offline, timeout, and server validation errors as the same user problem.

## Output Checklist

- Query and mutation ownership is obvious.
- Cache keys and invalidation behavior are explicit.
- Error surfaces are intentional and user-readable.
- Auth-sensitive requests have one clear refresh path.
- The screen behaves predictably when refetching, retrying, cancelling, or failing.

## References

- `references/query-and-error-patterns.md` for default service, cache, and error patterns.

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
