# Build And Upgrade

## Build targets

- Development: fast iteration, dev client
- Preview: QA and stakeholder review
- Production: store-ready or OTA-ready release

## Release discipline

- Validate local app before remote build
- Keep environment-specific config explicit
- Separate preview and production channels
- Document rollback path before release

## Upgrade discipline

- Upgrade Expo one SDK step at a time
- Read migration notes before touching code
- Fix deprecations near the boundary they affect
- Re-run smoke checks after every upgrade step

