# Flex Switch

<p align="center">
  <img src="https://github.com/omar-hanafy/flex_switch/blob/main/screenshots/1.gif?raw=true" alt="FlexSwitch Sample" width="90%">
</p>

Multi-option segmented control for Flutter. Keyboard accessible, RTL-aware, drag-to-select, themable, and fast.

- Zero boilerplate: boolean, enum, or custom values
- Keyboard: Arrow/Home/End; focus ring; semantics
- Drag-to-select across segments; full-width tap targets
- RTL-aware layout and key handling
- Highly themable via `FlexSwitchStyle`

## Install

```yaml
dart pub add flex_switch
```


## Quick start
```dart
import 'package:flex_switch/flex_switch.dart';
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});
  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    return FlexSwitch.boolean(
      value: enabled,
      onChanged: (v) => setState(() => enabled = v),
      trueLabel: 'On',
      falseLabel: 'Off',
      trueIcon: Icons.check,
      falseIcon: Icons.close,
    );
  }
}
```

## Enums

```dart
enum ThemeSegment { light, system, dark }

FlexSwitch.fromEnum<ThemeSegment>(
  values: ThemeSegment.values,
  selectedValue: themeSeg,
  onChanged: (v) => setState(() => themeSeg = v),
  labelBuilder: (v) => switch (v) {
    ThemeSegment.light => 'Light',
    ThemeSegment.system => 'System',
    ThemeSegment.dark => 'Dark',
  },
  iconBuilder: (v) => switch (v) {
    ThemeSegment.light => Icons.wb_sunny_outlined,
    ThemeSegment.system => Icons.auto_mode_outlined,
    ThemeSegment.dark => Icons.dark_mode_outlined,
  },
);
```

## Custom values

```dart
FlexSwitch.fromValues<String>(
  values: const ['XS', 'S', 'M', 'L', 'XL'],
  selectedValue: size,
  onChanged: (v) => setState(() => size = v),
  label: (v) => v,
  style: const FlexSwitchStyle(
    showDividers: true,
    enableRipple: true,
  ),
);
```

## Styling

```dart
const style = FlexSwitchStyle(
  backgroundColor: Color(0x11000000),
  thumbColor: Colors.white,
  activeLabelColor: null,   // defaults to theme.primary
  inactiveLabelColor: null, // defaults to blend of onSurface
  borderRadius: 16,
  thumbRadius: 12,
  padding: 5,
  itemPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  gap: 8,
  shadow: [BoxShadow(blurRadius: 12, color: Colors.black26)],
  duration: Duration(milliseconds: 250),
  curve: Curves.easeInOut,
  border: null,
  labelTextStyle: null,
  iconSize: null,            // computed from height if null
  showDividers: false,
  dividerColor: null,
  dividerThickness: 1,
  focusRingWidth: 2,
  enableRipple: false,
  segmentOverlayColor: null,
  splashFactory: null,
  enableTrackHoverOverlay: true,
  segmentGutter: 6,
);
```

## Accessibility
- Announces labels via Semantics; exposes selected state per segment
- Full keyboard support: Left/Right (RTL-aware), Home, End, Enter/Space
- Optional `semanticsLabel` and `tooltip` per option

## Example app
See `example/` for a runnable demo showing boolean, enum, and custom values with theming.

## License
MIT — see LICENSE.
