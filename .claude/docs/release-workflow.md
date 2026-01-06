# Release Workflow

This repo is consumed via SPM URL. Releases are tag-driven.

## Versioning

- Use semver: MAJOR.MINOR.PATCH
- Breaking changes: bump MAJOR
- Backward-compatible features: bump MINOR
- Fixes only: bump PATCH

## Steps

1. Update code and tests
2. Run `swift test`
3. Commit changes
4. Tag and push:
   - `git tag x.y.z`
   - `git push --tags`
