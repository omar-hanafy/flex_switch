import 'package:flutter/material.dart';

/// Visual style for FlexSwitch.
///
/// All fields are optional; sensible defaults are used based on the active
/// [ThemeData]. Use [copyWith] to derive small variations.
class FlexSwitchStyle {
  /// Creates a style descriptor for FlexSwitch. All parameters are optional.
  const FlexSwitchStyle({
    this.backgroundColor,
    this.thumbColor,
    this.activeLabelColor,
    this.inactiveLabelColor,
    this.borderRadius = 16.0,
    this.thumbRadius = 12.0,
    this.thumbPressScale = 0.95,
    this.padding = 5.0,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    this.gap = 8.0,
    this.shadow,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    this.border,
    this.labelTextStyle,
    this.iconSize,
    this.showDividers = false,
    this.dividerColor,
    this.dividerThickness = 1.0,
    this.hideDividersAdjacentToThumb = true,
    this.dividerFadeDuration,
    this.dividerFadeCurve,
    this.focusRingWidth = 2.0,
    this.enableRipple = false,
    this.segmentOverlayColor,
    this.splashFactory,
    this.enableTrackHoverOverlay = true,
    this.segmentGutter = 6.0,
  });

  /// Background color of the outer track.
  final Color? backgroundColor;

  /// Background color of the moving thumb (selected segment highlight).
  final Color? thumbColor;

  /// Color for labels/icons in the selected segment.
  /// Falls back to [ColorScheme.primary] if null.
  final Color? activeLabelColor;

  /// Color for labels/icons in unselected segments.
  /// Falls back to a blended [ColorScheme.onSurface] if null.
  final Color? inactiveLabelColor;

  /// Geometry.
  ///
  /// [borderRadius] rounds the outer track.
  final double borderRadius;

  /// Rounding applied to the moving thumb.
  final double thumbRadius;

  /// Scale applied to the thumb while pressed (pinned-edge transform keeps the
  /// touching edge fixed). Set to 1.0 to disable.
  final double thumbPressScale;

  /// Padding inside the outer track (applies to all sides).
  final double padding;

  /// Padding around the contents of each segment.
  final EdgeInsets itemPadding;

  /// Horizontal space between an option icon and label within a segment.
  final double gap;

  /// Thumb shadow.
  final List<BoxShadow>? shadow;

  /// Animation parameters.
  /// Duration of thumb/content transitions.
  final Duration duration;

  /// Easing curve for thumb/content transitions.
  final Curve curve;

  /// Optional border for the outer track (e.g. `Border.all(...)`).
  final BoxBorder? border;

  /// Typographic defaults (overridable per-option).
  final TextStyle? labelTextStyle;

  /// Fixed icon size; if null, computed from height.
  final double? iconSize;

  /// Whether to draw vertical dividers between segments.
  final bool showDividers;

  /// Color of the vertical dividers (falls back to theme dividerColor).
  final Color? dividerColor;

  /// Thickness of the vertical dividers in logical pixels.
  final double dividerThickness;

  /// When [showDividers] is true: fade dividers that touch the highlighted/selected
  /// segment, matching Cupertino's behavior.
  final bool hideDividersAdjacentToThumb;

  /// Optional override for divider fade duration/curve. Falls back to [duration]/[curve].
  final Duration? dividerFadeDuration;
  final Curve? dividerFadeCurve;

  /// Focus ring width for keyboard focus.
  final double focusRingWidth;

  /// Interaction visuals for segments.
  final bool enableRipple;

  /// Overlay color for segment interactions (pressed/hover/focus).
  final WidgetStateProperty<Color?>? segmentOverlayColor;

  /// Splash factory used when [enableRipple] is true.
  final InteractiveInkFeatureFactory? splashFactory;

  /// Show a subtle hover overlay across the whole track.
  final bool enableTrackHoverOverlay;

  /// Horizontal space reserved around each segment (logical px).
  /// Interior boundaries apply half this value per neighboring segment, while
  /// the outer track edges keep the full [padding] distance.
  final double segmentGutter;

  /// Returns a copy with the specified fields replaced.
  FlexSwitchStyle copyWith({
    Color? backgroundColor,
    Color? thumbColor,
    Color? activeLabelColor,
    Color? inactiveLabelColor,
    double? borderRadius,
    double? thumbRadius,
    double? thumbPressScale,
    double? padding,
    EdgeInsets? itemPadding,
    double? gap,
    List<BoxShadow>? shadow,
    Duration? duration,
    Curve? curve,
    BoxBorder? border,
    TextStyle? labelTextStyle,
    double? iconSize,
    bool? showDividers,
    Color? dividerColor,
    double? dividerThickness,
    bool? hideDividersAdjacentToThumb,
    Duration? dividerFadeDuration,
    Curve? dividerFadeCurve,
    double? focusRingWidth,
    bool? enableRipple,
    WidgetStateProperty<Color?>? segmentOverlayColor,
    InteractiveInkFeatureFactory? splashFactory,
    bool? enableTrackHoverOverlay,
    double? segmentGutter,
  }) {
    return FlexSwitchStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      thumbColor: thumbColor ?? this.thumbColor,
      activeLabelColor: activeLabelColor ?? this.activeLabelColor,
      inactiveLabelColor: inactiveLabelColor ?? this.inactiveLabelColor,
      borderRadius: borderRadius ?? this.borderRadius,
      thumbRadius: thumbRadius ?? this.thumbRadius,
      thumbPressScale: thumbPressScale ?? this.thumbPressScale,
      padding: padding ?? this.padding,
      itemPadding: itemPadding ?? this.itemPadding,
      gap: gap ?? this.gap,
      shadow: shadow ?? this.shadow,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      border: border ?? this.border,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      iconSize: iconSize ?? this.iconSize,
      showDividers: showDividers ?? this.showDividers,
      dividerColor: dividerColor ?? this.dividerColor,
      dividerThickness: dividerThickness ?? this.dividerThickness,
      hideDividersAdjacentToThumb:
          hideDividersAdjacentToThumb ?? this.hideDividersAdjacentToThumb,
      dividerFadeDuration: dividerFadeDuration ?? this.dividerFadeDuration,
      dividerFadeCurve: dividerFadeCurve ?? this.dividerFadeCurve,
      focusRingWidth: focusRingWidth ?? this.focusRingWidth,
      enableRipple: enableRipple ?? this.enableRipple,
      segmentOverlayColor: segmentOverlayColor ?? this.segmentOverlayColor,
      splashFactory: splashFactory ?? this.splashFactory,
      enableTrackHoverOverlay:
          enableTrackHoverOverlay ?? this.enableTrackHoverOverlay,
      segmentGutter: segmentGutter ?? this.segmentGutter,
    );
  }

  /// Merge [other] into this style; non-null fields in [other] take priority.
  FlexSwitchStyle merge(FlexSwitchStyle? other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other.backgroundColor,
      thumbColor: other.thumbColor,
      activeLabelColor: other.activeLabelColor,
      inactiveLabelColor: other.inactiveLabelColor,
      borderRadius: other.borderRadius,
      thumbRadius: other.thumbRadius,
      thumbPressScale: other.thumbPressScale,
      padding: other.padding,
      itemPadding: other.itemPadding,
      gap: other.gap,
      shadow: other.shadow,
      duration: other.duration,
      curve: other.curve,
      border: other.border,
      labelTextStyle: other.labelTextStyle,
      iconSize: other.iconSize,
      showDividers: other.showDividers,
      dividerColor: other.dividerColor,
      dividerThickness: other.dividerThickness,
      hideDividersAdjacentToThumb: other.hideDividersAdjacentToThumb,
      dividerFadeDuration: other.dividerFadeDuration,
      dividerFadeCurve: other.dividerFadeCurve,
      focusRingWidth: other.focusRingWidth,
      enableRipple: other.enableRipple,
      segmentOverlayColor: other.segmentOverlayColor,
      splashFactory: other.splashFactory,
      enableTrackHoverOverlay: other.enableTrackHoverOverlay,
      segmentGutter: other.segmentGutter,
    );
  }
}

/// Theme-aware defaults and overrides for FlexSwitch.
@immutable
class FlexSwitchTheme extends ThemeExtension<FlexSwitchTheme> {
  const FlexSwitchTheme({
    this.backgroundColor,
    this.thumbColor,
    this.activeLabelColor,
    this.inactiveLabelColor,
    this.dividerColor,
    this.labelTextStyle,
    this.segmentOverlayColor,
    this.splashFactory,
  });

  final Color? backgroundColor;
  final Color? thumbColor;
  final Color? activeLabelColor;
  final Color? inactiveLabelColor;
  final Color? dividerColor;
  final TextStyle? labelTextStyle;
  final WidgetStateProperty<Color?>? segmentOverlayColor;
  final InteractiveInkFeatureFactory? splashFactory;

  /// Base defaults that respond to the ambient [ThemeData].
  static FlexSwitchStyle defaults(ThemeData theme) {
    return FlexSwitchStyle(
      backgroundColor:
          theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
      thumbColor: theme.colorScheme.surface,
      labelTextStyle: theme.textTheme.labelLarge,
      dividerColor: theme.dividerColor.withValues(alpha: 0.35),
    );
  }

  /// Apply this extension's overrides to [base].
  FlexSwitchStyle applyTo(FlexSwitchStyle base) {
    return base.copyWith(
      backgroundColor: backgroundColor ?? base.backgroundColor,
      thumbColor: thumbColor ?? base.thumbColor,
      activeLabelColor: activeLabelColor ?? base.activeLabelColor,
      inactiveLabelColor: inactiveLabelColor ?? base.inactiveLabelColor,
      labelTextStyle: labelTextStyle ?? base.labelTextStyle,
      dividerColor: dividerColor ?? base.dividerColor,
      segmentOverlayColor: segmentOverlayColor ?? base.segmentOverlayColor,
      splashFactory: splashFactory ?? base.splashFactory,
    );
  }

  /// Resolve the effective style using widget overrides, theme extension, and defaults.
  static FlexSwitchStyle resolve(
    BuildContext context,
    FlexSwitchStyle? widgetOverride,
  ) {
    final theme = Theme.of(context);
    // Defaults derived from ThemeData.
    FlexSwitchStyle resolved = defaults(theme);
    // Theme extension overrides.
    final extension = theme.extension<FlexSwitchTheme>();
    if (extension != null) {
      resolved = extension.applyTo(resolved);
    }
    // Widget-level overrides take highest priority.
    resolved = resolved.merge(widgetOverride);
    return resolved;
  }

  @override
  FlexSwitchTheme copyWith({
    Color? backgroundColor,
    Color? thumbColor,
    Color? activeLabelColor,
    Color? inactiveLabelColor,
    Color? dividerColor,
    TextStyle? labelTextStyle,
    WidgetStateProperty<Color?>? segmentOverlayColor,
    InteractiveInkFeatureFactory? splashFactory,
  }) {
    return FlexSwitchTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      thumbColor: thumbColor ?? this.thumbColor,
      activeLabelColor: activeLabelColor ?? this.activeLabelColor,
      inactiveLabelColor: inactiveLabelColor ?? this.inactiveLabelColor,
      dividerColor: dividerColor ?? this.dividerColor,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      segmentOverlayColor: segmentOverlayColor ?? this.segmentOverlayColor,
      splashFactory: splashFactory ?? this.splashFactory,
    );
  }

  @override
  FlexSwitchTheme lerp(ThemeExtension<FlexSwitchTheme>? other, double t) {
    if (other is! FlexSwitchTheme) return this;
    return FlexSwitchTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      thumbColor: Color.lerp(thumbColor, other.thumbColor, t),
      activeLabelColor: Color.lerp(activeLabelColor, other.activeLabelColor, t),
      inactiveLabelColor:
          Color.lerp(inactiveLabelColor, other.inactiveLabelColor, t),
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t),
      labelTextStyle: TextStyle.lerp(labelTextStyle, other.labelTextStyle, t),
      segmentOverlayColor:
          t < 0.5 ? segmentOverlayColor : other.segmentOverlayColor,
      splashFactory: t < 0.5 ? splashFactory : other.splashFactory,
    );
  }
}
