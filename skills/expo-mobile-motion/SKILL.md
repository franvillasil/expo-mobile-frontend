---
name: expo-mobile-motion
description: Design and implement motion for Expo and React Native apps using Reanimated, gestures, transitions, and reduced-motion-safe interaction patterns. Use when adding microinteractions, screen transitions, gesture-driven UI, scroll-linked effects, or when reviewing animation quality and performance.
---

# Expo Mobile Motion

Use this skill when motion should improve clarity, feedback, and perceived quality. Favor motion that explains state changes and user intent. Avoid ornamental animation that slows the product down.

## Default Decisions

- Prefer Reanimated for non-trivial motion in Expo and React Native.
- Prefer Gesture Handler for gesture-driven interaction surfaces.
- Design for reduced motion from the start.
- Animate transforms and opacity before layout-heavy properties.
- Keep durations short and purposeful unless storytelling is the explicit goal.

## Motion Workflow

1. Define the job of the motion: feedback, transition, hierarchy, or delight.
2. Choose the lightest pattern that solves the problem.
3. Verify touch responsiveness before tuning the easing.
4. Add reduced-motion fallbacks.
5. Test on a real device or simulator for jank, interruption, and gesture conflicts.

Read [patterns.md](references/patterns.md) for the default motion catalog and guardrails.

## Anti-Patterns

- Animating everything on first render.
- Combining multiple simultaneous gestures without a conflict strategy.
- Letting animation block interaction or navigation.
- Using layout reflow when opacity or transform is enough.
- Ignoring accessibility settings or low-end device performance.

## Output Checklist

- Every animation has a user-facing reason to exist.
- Reduced motion is respected.
- Gestures cancel, interrupt, and resume predictably.
- Transitions stay within frame budget on device.
- Motion supports the UI system instead of competing with it.

## References

- `references/patterns.md` for motion categories, timing, and performance rules.

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
