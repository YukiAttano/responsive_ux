import 'dart:ui';

import 'package:flutter/widgets.dart';

/// A [WindowSize] is defined after the WindowSizeClass by Android and consists of a minimal value for width and height
/// where each corresponds to either the WindowSizeClass of the width or the WindowSizeClass of the height.
///
/// Example:
/// ```
///  The WindowSizeClass "Compact" is defined for
///  a width between  0 - 600 dp and
///  a height between 0 - 480 dp
/// ```
/// Compact is therefor implemented as width: 0 and height: 0
///
class WindowSize {
  final double width;
  final double height;

  const WindowSize(this.width, this.height);

  /// The returned [WindowSize] is valid only for [WindowSize.width].
  /// To receive the correct [WindowSize] for the height, use [ofHeight]
  ///
  /// [values] must be sorted ascending, otherwise it will result in wrong results
  ///
  /// [values] should always start with a defined value of [WindowSize.width] = 0 and [WindowSize.height] = 0
  static WindowSize ofWidth(double width, List<WindowSize> values) {
    assert(values.isNotEmpty, "The given list is empty");

    for (var windowSize in values.reversed) {
      if (width >= windowSize.width) {
        return windowSize;
      }
    }

    return values.first;
  }

  /// The returned [WindowSize] is valid only for [WindowSize.height].
  /// To receive the correct [WindowSize] for the width, use [ofWidth]
  ///
  /// [values] must be sorted ascending, otherwise it will result in wrong results
  ///
  /// [values] should always start with a defined value of [WindowSize.width] = 0 and [WindowSize.height] = 0
  static WindowSize ofHeight(double height, List<WindowSize> values) {
    assert(values.isNotEmpty, "The given list is empty");

    for (var windowSize in values.reversed) {
      if (height >= windowSize.height) {
        return windowSize;
      }
    }

    return values.first;
  }

  static (WindowSize, WindowSize) ofSize(Size size, List<WindowSize> values) {
    return (ofWidth(size.width, values), ofHeight(size.height, values));
  }

  @override
  int get hashCode => Object.hash(width, height);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is WindowSize && width == other.width && height == other.height;
  }

  @override
  String toString() {
    return "WindowSize:(width: $width, height: $height)";
  }
}
