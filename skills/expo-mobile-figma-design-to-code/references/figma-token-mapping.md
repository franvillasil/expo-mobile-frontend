# Figma Token Mapping

## Mapping order

1. Reuse existing project tokens
2. Alias new Figma values into project token names
3. Only add new tokens when the design introduces a reusable pattern

## Common mappings

- Figma color variable -> theme or Tailwind token
- Figma spacing value -> spacing scale token
- Figma text style -> typography token or text primitive variant
- Figma radius or shadow -> shared surface token

## Rule

Figma values should explain intent, not force literal copy-paste into code.

