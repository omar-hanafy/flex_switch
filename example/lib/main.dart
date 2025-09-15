import 'package:flex_switch/flex_switch.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FlexSwitchDemoApp());

class FlexSwitchDemoApp extends StatefulWidget {
  const FlexSwitchDemoApp({super.key});

  @override
  State<FlexSwitchDemoApp> createState() => _FlexSwitchDemoAppState();
}

class _FlexSwitchDemoAppState extends State<FlexSwitchDemoApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: FlexSwitchDemoPage(
        themeMode: _themeMode,
        onThemeModeChanged: (m) => setState(() => _themeMode = m),
      ),
    );
  }
}

class FlexSwitchDemoPage extends StatefulWidget {
  const FlexSwitchDemoPage({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  State<FlexSwitchDemoPage> createState() => _FlexSwitchDemoPageState();
}

class _FlexSwitchDemoPageState extends State<FlexSwitchDemoPage> {
  bool _disabled = false;
  bool _trackHoverOverlay = true;
  double _gutter = 10;
  bool _ripple = false;
  bool _primaryRippleTint = false;

  bool _boolValue = false;
  int _step = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlexSwitch Demo')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            runSpacing: 8,
            spacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SwitchListTile(
                title: const Text('Disabled'),
                value: _disabled,
                onChanged: (v) => setState(() => _disabled = v),
              ),
              SwitchListTile(
                title: const Text('Track hover overlay'),
                value: _trackHoverOverlay,
                onChanged: (v) => setState(() => _trackHoverOverlay = v),
              ),
              SwitchListTile(
                title: const Text('Ripple'),
                value: _ripple,
                onChanged: (v) => setState(() => _ripple = v),
              ),
              SwitchListTile(
                title: const Text('Primary ripple tint'),
                subtitle: const Text('Off = neutral grey, On = brand color'),
                value: _primaryRippleTint,
                onChanged: (v) => setState(() => _primaryRippleTint = v),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text('Segment gutter'),
              Expanded(
                child: Slider(
                  min: 0,
                  max: 12,
                  divisions: 12,
                  label: _gutter.toStringAsFixed(0),
                  value: _gutter,
                  onChanged: (v) => setState(() => _gutter = v),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          Text('Boolean', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          _Section(
            child: FlexSwitch.boolean(
              value: _boolValue,
              onChanged: (v) => setState(() => _boolValue = v),
              trueLabel: 'On',
              falseLabel: 'Off',
              trueIcon: Icons.check_rounded,
              falseIcon: Icons.close_rounded,
              disabled: _disabled,
              style: FlexSwitchStyle(
                enableTrackHoverOverlay: _trackHoverOverlay,
                segmentGutter: _gutter,
                enableRipple: _ripple,
                segmentOverlayColor: _primaryRippleTint
                    ? WidgetStateProperty.resolveWith<Color?>((states) {
                        final scheme = Theme.of(context).colorScheme;
                        if (states.contains(WidgetState.disabled)) {
                          return Colors.transparent;
                        }
                        if (states.contains(WidgetState.pressed)) {
                          return scheme.primary.withValues(alpha: 0.10);
                        }
                        if (states.contains(WidgetState.hovered)) {
                          return scheme.primary.withValues(alpha: 0.06);
                        }
                        if (states.contains(WidgetState.focused)) {
                          return scheme.primary.withValues(alpha: 0.08);
                        }
                        return Colors.transparent;
                      })
                    : null,
                borderRadius: 16,
                thumbRadius: 12,
              ),
              height: 44,
            ),
          ),

          const SizedBox(height: 16),
          Text(
            'Enum (ThemeMode)',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          _Section(
            child: FlexSwitch.fromEnum<ThemeMode>(
              values: ThemeMode.values,
              selectedValue: widget.themeMode,
              onChanged: widget.onThemeModeChanged,
              labelBuilder: (m) => switch (m) {
                ThemeMode.system => 'System',
                ThemeMode.light => 'Light',
                ThemeMode.dark => 'Dark',
              },
              iconBuilder: (m) => switch (m) {
                ThemeMode.system => Icons.brightness_auto_rounded,
                ThemeMode.light => Icons.light_mode_rounded,
                ThemeMode.dark => Icons.dark_mode_rounded,
              },
              activeColorBuilder: (m) => switch (m) {
                ThemeMode.system => Theme.of(context).colorScheme.primary,
                ThemeMode.light => Colors.amber,
                ThemeMode.dark => Colors.lightBlueAccent,
              },
              style: FlexSwitchStyle(
                showDividers: true,
                dividerThickness: 1,
                enableTrackHoverOverlay: _trackHoverOverlay,
                segmentGutter: _gutter,
                enableRipple: _ripple,
                segmentOverlayColor: _primaryRippleTint
                    ? WidgetStateProperty.resolveWith<Color?>((states) {
                        final scheme = Theme.of(context).colorScheme;
                        if (states.contains(WidgetState.disabled)) {
                          return Colors.transparent;
                        }
                        if (states.contains(WidgetState.pressed)) {
                          return scheme.primary.withValues(alpha: 0.10);
                        }
                        if (states.contains(WidgetState.hovered)) {
                          return scheme.primary.withValues(alpha: 0.06);
                        }
                        if (states.contains(WidgetState.focused)) {
                          return scheme.primary.withValues(alpha: 0.08);
                        }
                        return Colors.transparent;
                      })
                    : null,
                borderRadius: 16,
                thumbRadius: 12,
              ),
              disabled: _disabled,
              height: 48,
            ),
          ),

          const SizedBox(height: 16),
          Text(
            'From values (steps)',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          _Section(
            child: FlexSwitch.fromValues<int>(
              values: const [0, 1, 2, 3],
              selectedValue: _step,
              onChanged: (v) => setState(() => _step = v),
              label: (v) => 'Step $v',
              icon: (v) => switch (v) {
                0 => Icons.filter_1_rounded,
                1 => Icons.filter_2_rounded,
                2 => Icons.filter_3_rounded,
                _ => Icons.filter_4_rounded,
              },
              activeColor: (v) => Colors.primaries[v % Colors.primaries.length],
              style: FlexSwitchStyle(
                enableTrackHoverOverlay: _trackHoverOverlay,
                segmentGutter: _gutter,
                enableRipple: _ripple,
                segmentOverlayColor: _primaryRippleTint
                    ? WidgetStateProperty.resolveWith<Color?>((states) {
                        final scheme = Theme.of(context).colorScheme;
                        if (states.contains(WidgetState.disabled)) {
                          return Colors.transparent;
                        }
                        if (states.contains(WidgetState.pressed)) {
                          return scheme.primary.withValues(alpha: 0.10);
                        }
                        if (states.contains(WidgetState.hovered)) {
                          return scheme.primary.withValues(alpha: 0.06);
                        }
                        if (states.contains(WidgetState.focused)) {
                          return scheme.primary.withValues(alpha: 0.08);
                        }
                        return Colors.transparent;
                      })
                    : null,
                borderRadius: 18,
                thumbRadius: 14,
              ),
              disabled: _disabled,
              height: 46,
            ),
          ),

          const SizedBox(height: 24),
          Text(
            'Current values',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'disabled: $_disabled, trackHover: $_trackHoverOverlay, gutter: ${_gutter.toStringAsFixed(0)}',
          ),
          Text(
            'bool: $_boolValue, themeMode: ${widget.themeMode}, step: $_step',
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Row(children: [Expanded(child: child)]),
    );
  }
}
