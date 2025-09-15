# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-09-15

Initial release.

### Added
- Core `FlexSwitch` widget with:
  - Boolean factory: `FlexSwitch.boolean`
  - Enum factory: `FlexSwitch.fromEnum`
  - Values factory: `FlexSwitch.fromValues`
- Drag-to-select across segments
- Full keyboard support (Left/Right, Home/End, Enter/Space), RTL-aware
- A11y with Semantics + focus ring
- Theming via `FlexSwitchStyle` (colors, radii, dividers, ripple, animation)
- Example app under `example/`
