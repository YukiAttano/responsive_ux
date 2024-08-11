import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:responsive_ux/responsive_ux.dart';

/// A [Breakpoint] is defined as a minimum [width] and [height]
///
/// Example:
/// ```dart
///  Breakpoint small = Breakpoint(0, 0);
///  Breakpoint big   = Breakpoint(100, 50);
/// ```
///
class Breakpoint {
  final double width;
  final double height;

  const Breakpoint(this.width, this.height);

  const factory Breakpoint.width(double width) = _WidthBreakpoint;

  const factory Breakpoint.height(double height) = _HeightBreakpoint;

  Size toSize() => Size(width, height);

  WindowSize toWindowSize() => WindowSize(width, height);

  /// The breakpoint that is equal or smaller than [size].
  ///
  /// [values] must be sorted ascending, otherwise it will result in wrong results
  ///
  /// [values] should always start with a defined value of [Breakpoint.width] = 0 and [Breakpoint.height] = 0
  ///
  /// if no matching [Breakpoint] is found, the last value is returned
  static Breakpoint of(Size size, List<Breakpoint> values) {
    assert(values.isNotEmpty, "The given list is empty");

    for (var breakpoint in values.reversed) {
      if (breakpoint.matches(size)) {
        return breakpoint;
      }
    }

    return values.last;
  }

  bool matches(Size size) {
    return size >= toSize();
  }

  @override
  int get hashCode => Object.hash(width, height);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is Breakpoint && width == other.width && height == other.height;
  }

  @override
  String toString() {
    return "Breakpoint:(width: $width, height: $height)";
  }
}

class _WidthBreakpoint extends Breakpoint {
  const _WidthBreakpoint(double width) : super(width, 0);

  @override
  bool matches(Size size) {
    return size.width >= width;
  }
}

class _HeightBreakpoint extends Breakpoint {
  const _HeightBreakpoint(double height) : super(0, height);

  @override
  bool matches(Size size) {
    return size.height >= height;
  }
}