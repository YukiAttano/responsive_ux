import 'window_size.dart';

sealed class WindowSizes {

  static const WindowSize compact = WindowSize(0, 0);
  static const WindowSize medium = WindowSize(600, 480);
  static const WindowSize expanded = WindowSize(840, 900);

  /// Meant for Desktop by Material
  ///
  /// https://m3.material.io/foundations/layout/applying-layout/window-size-classes#9e94b1fb-e842-423f-9713-099b40f13922
  static const WindowSize large = WindowSize(1200, 1200);

  /// Meant for Desktop by Material
  ///
  /// https://m3.material.io/foundations/layout/applying-layout/window-size-classes#9e94b1fb-e842-423f-9713-099b40f13922
  static const WindowSize extraLarge = WindowSize(1600, 1600);

  // TODO: check if this is the correct breakpoint for Apple
  // It is calculated from ChatGPT based on the official documentation
  static const WindowSize regular = WindowSize(768, 768);

  /// [WindowSize]Classes defined by Android (for Jetpack Compose, their native UI framework).
  ///
  /// see https://developer.android.com/develop/ui/compose/layouts/adaptive/window-size-classes?hl=de
  ///
  /// Changes in this list will be major updates
  static const List<WindowSize> compose = [
    WindowSizes.compact,
    WindowSizes.medium,
    WindowSizes.expanded,
  ];

  /// [WindowSize]Classes defined by Material
  ///
  /// see https://m3.material.io/foundations/layout/canonical-layouts/list-detail
  ///
  /// From: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
  /// ```
  /// Large and extra-large window size classes are most useful for creating web experiences tailored to laptop and desktop devices.
  /// Your product may not need large and extra-large window size classes.
  /// Consider your platform’s conventions and users when making decisions on which window size classes to design for.
  /// ```
  ///
  /// Changes in this list will be major updates
  static const List<WindowSize> material = [
    WindowSizes.compact,
    WindowSizes.medium,
    WindowSizes.expanded,
    WindowSizes.large,
    WindowSizes.extraLarge,
  ];


  /// [WindowSize]Classes defined by Apple
  ///
  /// see https://m3.material.io/foundations/layout/canonical-layouts/list-detail
  ///
  /// Changes in this list will be major updates
  static const List<WindowSize> cupertino = [
    WindowSizes.compact,
    WindowSizes.regular,
  ];

  /// Changes in this list will be major updates.
  static const List<WindowSize> all = [
    WindowSizes.compact,
    WindowSizes.medium,
    WindowSizes.regular,
    WindowSizes.expanded,
    WindowSizes.large,
    WindowSizes.extraLarge,
  ];
}

