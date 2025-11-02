import "package:flutter/widgets.dart";

import "../data/window_size.dart";
import "../ui/window_size_configuration.dart";

/// Notifies its listeners only on changed [width] and [height] values
class WindowSizeNotifier extends ChangeNotifier {
  WindowSize? width;
  WindowSize? height;

  /// Allows listening to [WindowSizeConfiguration] changes
  ///
  /// call [check] or [safeCheck] in [State.didChangeDependencies]
  WindowSizeNotifier({this.width, this.height});

  /// if no [WindowSizeConfiguration] ancestor is found, [width] and [height] will be null
  ///
  /// As this function subscribes to [InheritedWidget] it must be called in [State.didChangeDependencies]
  void safeCheck(BuildContext context) {
    WindowSize? w;
    WindowSize? h;

    (w, h) = WindowSizeConfiguration.windowSizeMaybeOf(context) ?? (null, null);

    if (w != width || h != height) {
      width = w;
      height = h;
      notifyListeners();
    }
  }

  /// [width] and [height] will always have a non-null value after this check.
  ///
  /// As this function subscribes to an [InheritedWidget] it must be called in [State.didChangeDependencies]
  void check(BuildContext context) {
    WindowSize w;
    WindowSize h;

    (w, h) = WindowSizeConfiguration.windowSizeOf(context);

    if (w != width || h != height) {
      width = w;
      height = h;
      notifyListeners();
    }
  }
}
