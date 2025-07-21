/// @docImport  "package:flutter/cupertino.dart";
/// @docImport  "package:flutter/material.dart";
library;

import "package:flutter/foundation.dart";
import "package:flutter/widgets.dart";

import "../../responsive_ux.dart";
import "../logic/platform_helper.dart";

/// Should be inserted high in the Widget tree, e.g. beneath the [WidgetsApp]
///
/// returns [WindowSizes.material] if no configuration is given
class WindowSizeConfiguration extends StatelessWidget {
  final WindowSizeConfigurationData data;
  final Widget child;

  /// Falls back to [WindowSizeConfigurationData.material] as it is more versatile than the others.
  const WindowSizeConfiguration({super.key, this.data = _fallback, required this.child});

  @Deprecated("use WindowSizeConfiguration.adaptivePlatform instead")
  factory WindowSizeConfiguration.adaptive({Key? key, required TargetPlatform platform, required Widget child}) = WindowSizeConfiguration.adaptivePlatform;

  /// Uses a recommend set for the specified [platform]
  ///
  /// Use Theme.of(context).platform to retrieve a mockable value
  ///
  /// ```text
  ///   Android:      WindowSizes.compose
  ///   iOS / macOS:  WindowSizes.cupertino
  ///   Other:        WindowSizes.material
  /// ```
  ///
  /// See [adaptivePlatformConfig] for a more detailed use case.
  WindowSizeConfiguration.adaptivePlatform({Key? key, required TargetPlatform platform, required Widget child})
      : this(key: key, data: adaptivePlatformConfig(platform), child: child);

  /// Uses a recommend set for the specified [WidgetsApp] ancestor
  ///
  /// ```text
  ///   MaterialApp:  WindowSizes.material
  ///   CupertinoApp: WindowSizes.cupertino
  ///   Other:        WindowSizes.desktop
  /// ```
  ///
  /// See [adaptiveAncestorConfig] for a more infos.
  WindowSizeConfiguration.adaptiveAncestor({Key? key, required BuildContext context, required Widget child})
      : this(key: key, data: adaptiveAncestorConfig(context), child: child);

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
  /// (Are GoogleTV's not running Android?)
  ///
  /// iOS and macOS are going with Cupertino dimensions.
  ///
  /// A [kIsWeb] check is ignored to allow the same behaviour as if it would run natively on the device.
  ///
  /// If you make no difference in terms of UI for any platform, e.g. using always a MaterialApp and not a CupertinoApp (or vice versa),
  /// don't use the adaptive configuration and always apply [WindowSizeConfigurationData.material] for example.
  static WindowSizeConfigurationData adaptivePlatformConfig(TargetPlatform platform) {
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

  /// will return a config based on the used [WidgetsApp] type (e.g. [CupertinoApp] or [MaterialApp]).
  ///
  /// While [adaptivePlatformConfig] decides based on the [TargetPlatform] recommendations (made by Android/Apple),
  /// this method decides based on the UI recommendations of the UI Style (Material/Cupertino)
  static WindowSizeConfigurationData adaptiveAncestorConfig(BuildContext context) {
    if (isCupertinoApp(context)) {
      return const WindowSizeConfigurationData.cupertino();
    } else if (isMaterialApp(context)) {
      return const WindowSizeConfigurationData.material();
    } else {
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
