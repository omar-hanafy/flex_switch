/// Shared types used by FlexSwitch and related styles.
///
/// Allows `DragCommitBehavior` to be imported without pulling in the main
/// widget implementation, and helps avoid circular imports between style/theme
/// classes.
enum DragCommitBehavior { immediate, onRelease }

/// Layout models for [FlexSwitch].
///
/// Currently only [equal] is supported: all segments share equal width.
enum FlexSwitchLayout {
  /// All segments share equal width.
  equal,

  /// Each segment gets width proportional to its intrinsic content (icon + text),
  /// scaled to fit the available space.
  proportional,
}
