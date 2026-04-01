# Figma Component Mapping

## Preferred translation

- Figma button -> project button primitive
- Figma card or tile -> shared surface component
- Figma input field -> shared field primitive
- Figma section shell -> feature component or screen section

## Decision rule

If the Figma node maps cleanly to an existing primitive, reuse it.

If the Figma node combines multiple primitives into a stable pattern, create a feature component.

If the node represents a new cross-feature pattern, extract a new shared component only after validating its API.

