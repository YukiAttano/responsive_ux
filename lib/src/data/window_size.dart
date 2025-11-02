
import "package:flutter/widgets.dart";
import "breakpoint.dart";

/// [WindowSize] is named after the WindowSizeClass by Android and consists of the min value for its width and height.
///
/// Example:
/// ```text
///  The WindowSizeClass "Compact" is defined for
///  a width between  0 - 600 dp and
///  a height between 0 - 480 dp
/// ```
/// As Compact starts at 0, it is therefor implemented as width: 0 and height: 0
/// The WindowSize Medium would start at w:600 and h:480 and is therefor defined like that.
///
/// A WindowSize is defined per width and height independently.
/// Example:
/// ```text
///   WindowSize medium = WindowSize(600, 480)
///
///   // The WindowSizeClass for width "medium" is 600
///   // The WindowSizeClass for height "medium" is 480
///   // Both are the "medium" WindowSizeClass but the Size is independently calculated
/// ```
@immutable
class WindowSize {
  final double width;
  final double height;

  const WindowSize(this.width, this.height);

  Size toSize() => Size(width, height);
  Breakpoint toBreakpoint() => Breakpoint(width, height);

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
    return "WindowSize(width: $width, height: $height)";
  }
}
