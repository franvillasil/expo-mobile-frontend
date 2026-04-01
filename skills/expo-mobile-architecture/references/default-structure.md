# Default Structure

Use this layout when a repo does not already have a stronger convention:

```text
app/
  (auth)/
  (tabs)/
  _layout.tsx
src/
  features/
    profile/
      components/
      hooks/
      services/
      types.ts
  components/
    ui/
  lib/
    api/
    storage/
    analytics/
    query-client.ts
  stores/
  types/
```

## Placement rules

- New route file: `app/...`
- Feature-specific component: `src/features/<feature>/components/`
- Feature-specific query hook: `src/features/<feature>/hooks/`
- Shared primitive: `src/components/ui/`
- Global API client or storage utility: `src/lib/`
- Shared store only when multiple features depend on it

## Migration rule

If the repo already has a coherent structure, preserve it and borrow only the decision rules from the skill.

