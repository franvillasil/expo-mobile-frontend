---
name: expo-mobile-figma-design-to-code
description: Translate Figma mobile screens or components into production-ready Expo and React Native code with design-context fetching, screenshot validation, asset handling, and token-aware implementation. Use when a task includes a Figma URL, node ID, screen redesign, or component work that must match Figma while still respecting the project's UI system.
---

# Expo Mobile Figma Design to Code

This skill is optional. It is only useful when a real Figma source exists and the user wants visual fidelity. Figma should guide implementation, not replace the project's architecture, tokens, or component model.

## Prerequisites

- Figma MCP must already be configured by the user.
- The task must include a concrete Figma URL, file key, or node ID.
- The target project should already have a UI system or token strategy.

Read [figma-setup.md](references/figma-setup.md) before trying to use Figma MCP in a fresh environment.

## Required Workflow

1. Fetch design context for the exact node.
2. Fetch a screenshot for the same node or variant.
3. Download assets only after the first two steps succeed.
4. Map Figma values to project tokens and components.
5. Implement the screen or component in project conventions.
6. Validate parity against the screenshot before declaring it done.

Read [figma-implementation-flow.md](references/figma-implementation-flow.md) for the full workflow.

## Anti-Patterns

- Treating raw Figma output as final production code.
- Implementing from a screenshot without structured node context.
- Introducing new icon packs when the asset already exists in the Figma payload.
- Hardcoding Figma values instead of mapping to existing tokens.
- Using this workflow when the project has no design system and no Figma source of truth.

## Output Checklist

- Node context and screenshot both match the target variant.
- Assets came from the Figma payload, not placeholders.
- Project tokens and shared components were reused where possible.
- The final implementation is visually close and structurally idiomatic.
- Any mismatch between Figma and project conventions is called out explicitly.

## References

- `references/figma-setup.md` for setup and environment checks.
- `references/figma-implementation-flow.md` for the required design-to-code workflow.
- `references/figma-token-mapping.md` for mapping variables and tokens.
- `references/figma-component-mapping.md` for turning Figma structures into reusable UI code.

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
