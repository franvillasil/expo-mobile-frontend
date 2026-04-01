# Motion Patterns

## Prefer these patterns

- Tap feedback: scale or opacity, under 150ms
- Screen enter: subtle fade or translate, under 250ms
- Sheet or modal: shared axis or slide, interruptible
- Reordering or layout changes: spring with clear end state
- Scroll-linked effects: low amplitude, never fight content readability

## Reduced motion

- Replace large movement with opacity change or no motion
- Keep essential state feedback even when motion is reduced

## Performance guardrails

- Prefer transform and opacity
- Avoid animating costly layout properties in long lists
- Test gestures under stress, not just in ideal conditions

