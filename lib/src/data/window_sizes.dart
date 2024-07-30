import 'window_size.dart';

sealed class WindowSizes {

  static const WindowSize compact = WindowSize(0, 0);
  static const WindowSize medium = WindowSize(600, 480);
  static const WindowSize expanded = WindowSize(840, 900);

  /// [WindowSize]Classes defined by Android and recommend in the Material library
  ///
  /// defined after https://developer.android.com/develop/ui/compose/layouts/adaptive/window-size-classes?hl=de
  ///
  /// Changes in this list will be major updates
  static const List<WindowSize> material = [
    WindowSizes.compact,
    WindowSizes.medium,
    WindowSizes.expanded
  ];
}

