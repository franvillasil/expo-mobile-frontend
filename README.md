# expo-mobile-frontend

> Reusable Codex plugin for Expo and React Native teams shipping cleaner frontend decisions.

![Expo](https://img.shields.io/badge/Expo-ready-0F172A?style=for-the-badge&logo=expo)
![React Native](https://img.shields.io/badge/React%20Native-workflows-2563EB?style=for-the-badge&logo=react)
![Tailwind](https://img.shields.io/badge/Tailwind%2FNativeWind-included-06B6D4?style=for-the-badge&logo=tailwindcss)
![Figma Optional](https://img.shields.io/badge/Figma-optional-F24E1E?style=for-the-badge&logo=figma)

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

Restart Codex after installation.

## Local dev install

```bash
git clone https://github.com/franvillasil/expo-mobile-frontend.git
cd expo-mobile-frontend
./scripts/install.sh
```

Default install path follows the OpenAI plugin docs: `~/.codex/plugins/expo-mobile-frontend`.

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

## Roadmap

- Phase 2: Figma design system sync
- Phase 2: richer visual assets and metadata
- Phase 2: optional skill UI metadata via `agents/openai.yaml`
