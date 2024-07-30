import 'package:flutter/widgets.dart';

import '../data/window_size_configuration_data.dart';

/// Should be inserted high in the Widget tree, e.g. beneath the [WidgetsApp]
///
/// returns [WindowSizes.material] if no configuration is given
class WindowSizeConfiguration extends StatelessWidget {
  final WindowSizeConfigurationData data;
  final Widget child;

  const WindowSizeConfiguration({super.key, this.data = _fallback, required this.child});

  static const WindowSizeConfigurationData _fallback = WindowSizeConfigurationData.material();

  @override
  Widget build(BuildContext context) {
    return _InheritedConfiguration(
      data: data,
      child: child,
    );
  }

  static WindowSizeConfigurationData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedConfiguration>()?.data;
  }

  static WindowSizeConfigurationData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedConfiguration>()?.data ?? _fallback;
  }
}

class _InheritedConfiguration extends InheritedWidget {
  final WindowSizeConfigurationData data;

  const _InheritedConfiguration({super.key, required this.data, required super.child});

  @override
  bool updateShouldNotify(covariant _InheritedConfiguration oldWidget) {
    return data != oldWidget.data;
  }
}
