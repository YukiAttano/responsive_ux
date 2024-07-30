import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:responsive_ui/src/data/window_size.dart';
import 'package:responsive_ui/src/data/window_sizes.dart';

class WindowSizeConfigurationData {
  final List<WindowSize> sizes;

  const WindowSizeConfigurationData._({required this.sizes});

  factory WindowSizeConfigurationData({required List<WindowSize> sizes}) {
    assert(sizes.isNotEmpty);

    return WindowSizeConfigurationData._(sizes: sizes);
  }

  const WindowSizeConfigurationData.material() : this._(sizes: WindowSizes.material);

  WindowSize getWidthWindowSize(double width) => WindowSize.ofWidth(width, sizes);

  WindowSize getHeightWindowSize(double height) => WindowSize.ofHeight(height, sizes);

  (WindowSize, WindowSize) getWindowSize(Size size) {
    return (getWidthWindowSize(size.width), getHeightWindowSize(size.height));
  }

  /// Returns (width, height) [WindowSize] of the current view.
  ///
  /// Note: https://main-api.flutter.dev/flutter/services/SystemChrome/setPreferredOrientations.html
  /// As described in the documentation above, [MediaQuery.size] might return a letterboxed size.
  (WindowSize, WindowSize) windowSizeOfMediaQuery(BuildContext context) {
    return getWindowSize(MediaQuery.sizeOf(context));
  }

  (WindowSize, WindowSize) windowSizeOfMediaQueryData(MediaQueryData data) {
    return getWindowSize(data.size);
  }

  (WindowSize, WindowSize) windowSizeOfDisplay(Display display) {
    return getWindowSize(display.size / display.devicePixelRatio);
  }
}
