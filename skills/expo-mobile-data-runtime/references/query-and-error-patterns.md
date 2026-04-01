# Query And Error Patterns

## Default layering

- Transport client in `src/lib/api/`
- Domain or feature service in `src/features/<feature>/services/`
- Query hook in `src/features/<feature>/hooks/`
- UI reads from the hook, not from `fetch` directly

## Query rules

- Use stable cache keys
- Keep query functions pure
- Invalidate only the keys affected by a mutation
- Use placeholder data or skeletons deliberately

## Error categories

- Connectivity: timeout, offline, DNS, cancelled
- Auth: expired token, forbidden, revoked session
- Validation: bad user input, backend contract failure
- Server: 5xx and unknown failures

Each category should produce a different recovery path in UI.

