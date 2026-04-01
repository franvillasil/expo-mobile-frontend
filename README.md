# expo-mobile-frontend

> Reusable mobile frontend toolkit for Codex and Claude Code teams shipping cleaner Expo and React Native decisions.

![Expo](https://img.shields.io/badge/Expo-ready-0F172A?style=for-the-badge&logo=expo)
![Claude Code](https://img.shields.io/badge/Claude%20Code-supported-D97706?style=for-the-badge)
![React Native](https://img.shields.io/badge/React%20Native-workflows-2563EB?style=for-the-badge&logo=react)
![Tailwind](https://img.shields.io/badge/Tailwind%2FNativeWind-included-06B6D4?style=for-the-badge&logo=tailwindcss)

![AI mobile designer illustration](./assets/hero-mobile-agent.svg)

## What's inside

| Skill | What it covers | Use it when... |
| --- | --- | --- |
| `expo-mobile-architecture` | Routing, feature boundaries, TS ownership, state placement | You are creating folders, routes, stores, forms, or moving logic around |
| `expo-mobile-ui-system` | NativeWind, tokens, theming, reusable UI patterns | You are building or restyling screens and components |
| `expo-mobile-motion` | Reanimated, gestures, transitions, reduced motion | You are adding motion or reviewing interaction quality |
| `expo-mobile-data-runtime` | TanStack Query, auth-aware fetching, mutations, error boundaries | You are wiring APIs, cache, mutations, retries, or forms |
| `expo-mobile-quality-gates` | Accessibility, hardening, perf, device QA, react-doctor | A feature is almost done and needs a final pass |
| `expo-mobile-release-workflow` | Expo Dev Client, EAS, upgrades, release discipline | You are preparing builds, previews, or SDK upgrades |
| `expo-mobile-figma-design-to-code` | Figma URL/node to production-ready Expo code | You are implementing UI from Figma with optional MCP |

## Install in 1 step

```bash
curl -fsSL https://raw.githubusercontent.com/franvillasil/expo-mobile-frontend/main/scripts/install-from-github.sh | bash
```

The installer asks where you want it:
- `Codex`
- `Claude Code`
- both at the same time

Direct install for both:

```bash
curl -fsSL https://raw.githubusercontent.com/franvillasil/expo-mobile-frontend/main/scripts/install-from-github.sh | bash -s -- --targets codex,claude
```

## Local dev install

```bash
git clone https://github.com/franvillasil/expo-mobile-frontend.git
cd expo-mobile-frontend
./scripts/install-universal.sh
```

Default install paths:
- Codex: `~/.codex/plugins/expo-mobile-frontend`
- Claude Code: `~/.claude/skills/`

Claude Code plugin development is also supported through [`.claude-plugin/plugin.json`](./.claude-plugin/plugin.json) and `claude --plugin-dir /path/to/expo-mobile-frontend`.

## Recommended stack

- Expo Router
- NativeWind or Tailwind-flavored RN styling
- Reanimated + Gesture Handler
- TanStack Query
- Figma MCP, if you want design-to-code workflows

## Optional Figma workflow

1. Share a Figma URL or node ID.
2. Use `expo-mobile-figma-design-to-code` to fetch design context, screenshot, and assets.
3. Map the design to project tokens and verify parity in code.

## Not included yet

- Bundled MCP configuration
- Business-specific project overlays
- Full Figma design system sync
- OpenCode adapter

## Roadmap

- Phase 2: Figma design system sync
- Phase 2: richer visual assets and metadata
- Phase 2: OpenCode commands and agent adapter
