import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../data/window_size.dart';
import '../data/window_size_configuration_data.dart';

/// Should be inserted high in the Widget tree, e.g. beneath the [WidgetsApp]
///
/// returns [WindowSizes.material] if no configuration is given
class WindowSizeConfiguration extends StatelessWidget {
  final WindowSizeConfigurationData data;
  final Widget child;

  /// Falls back to [WindowSizeConfigurationData.material] as it is more versatile than the others.
  const WindowSizeConfiguration({super.key, this.data = _fallback, required this.child});

  /// Uses a recommend set for the specified [platform]
  /// if [CupertinoApp] is used for iOS/macOS and [MaterialApp] for the rest.
  ///
  /// Use Theme.of(context).platform to retrieve a mockable value
  ///
  /// ```
  ///   Android:      WindowSizes.compose
  ///   iOS / macOS:  WindowSizes.cupertino
  ///   Other:        WindowSizes.material
  /// ```
  ///
  /// See [_adaptiveData] for a more detailed use case.
  ///
  // TODO(YukiAttano): make Adaptive decide based on an ancestor [WidgetApp] of type [MaterialApp]/[CupertinoApp]
  WindowSizeConfiguration.adaptive({Key? key, required TargetPlatform platform, required Widget child}) : this(key: key, data: _adaptiveData(platform), child: child);

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

  static (WindowSize, WindowSize)? windowSizeMaybeOf(BuildContext context) {
    WindowSizeConfigurationData? config = maybeOf(context);

    if (config == null) return null;

    return config.getWindowSize(MediaQuery.sizeOf(context));
  }

  static (WindowSize, WindowSize) windowSizeOf(BuildContext context) {
    WindowSizeConfigurationData config = of(context);

    return config.getWindowSize(MediaQuery.sizeOf(context));
  }

  /// The recommendation is defined as follows:
  ///
  /// As noted in the Material documentation, Android does only support dimensions up to 1200pt and therefor does not need the Desktop sizes (https://m3.material.io/foundations/layout/applying-layout/window-size-classes#9e94b1fb-e842-423f-9713-099b40f13922)
  /// (Is a GoogleTV not running Android?)
  /// iOS and macOS are going with Cupertino dimensions because Apple
  /// and all other platforms get the Desktop dimensions as they have the potential to be big
  ///
  /// A [kIsWeb] check is ignored to allow the same behaviour as if it would run natively on the device
  ///
  /// This is not perfect and need further discussion.
  /// It also makes sense only if [CupertinoApp] is used for [TargetPlatform.iOS] and [TargetPlatform.macOS].
  static WindowSizeConfigurationData _adaptiveData(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return const WindowSizeConfigurationData.compose();
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return const WindowSizeConfigurationData.cupertino();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const WindowSizeConfigurationData.desktop();
    }
  }
}

class _InheritedConfiguration extends InheritedWidget {
  final WindowSizeConfigurationData data;

  const _InheritedConfiguration({required this.data, required super.child});

  @override
  bool updateShouldNotify(covariant _InheritedConfiguration oldWidget) {
    return data != oldWidget.data;
  }
}
