import 'package:flutter/material.dart';

import '../data/window_size.dart';
import '../data/window_size_configuration_data.dart';
import 'window_size_configuration.dart';

typedef WindowSizeBuilder = Widget Function(BuildContext context, WindowSize width, WindowSize height, Widget? child);

/// To define your own [WindowSize]s, insert a [WindowSizeConfiguration] in the Widget tree
class WindowSizedBox extends StatefulWidget {
  final WindowSizeConfigurationData? data;
  final WindowSizeBuilder builder;
  final Widget? child;

  const WindowSizedBox._({super.key, this.data, required this.builder, this.child});

  /// Access its configuration from an ancestor [WindowSizeConfiguration] widget.
  ///
  /// Intended to be used for root widgets that control the navigation UI like Screens/Pages.
  const WindowSizedBox({Key? key, required WindowSizeBuilder builder, Widget? child})
      : this._(key: key, builder: builder, child: child);

  /// Ignores any ancestor [WindowSizeConfiguration] and uses its own [data]
  ///
  /// Intended for easier testing and should not be used in production.
  const WindowSizedBox.override(
      {Key? key, WindowSizeConfigurationData? data, required WindowSizeBuilder builder, Widget? child})
      : this._(key: key, data: data, builder: builder, child: child);

/*
  /// Uses the given [view] or the first found view instead of [MediaQuery].
  /// This will return a [WindowSize] for the full display and not the Window Flutter is rendered in.
  ///
  /// Most probably useless and unused
  WindowSizeBuilder.view({Key? key, FlutterView? view, required Builder builder, Widget? child})
      : this._(
          key: key,
          flutterView: view ?? WidgetsBinding.instance.platformDispatcher.views.firstOrNull,
          builder: builder,
          child: child,
        );
*/

  @override
  State<WindowSizedBox> createState() => _WindowSizedBoxState();
}

class _WindowSizedBoxState extends State<WindowSizedBox> {
  WindowSize? _width;
  WindowSize? _height;

  late Widget _child;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _evaluate();
  }

  @override
  void didUpdateWidget(covariant WindowSizedBox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.data != oldWidget.data || widget.builder != oldWidget.builder || widget.child != oldWidget.child) {
      _evaluate(force: true);
    }
  }

  void _evaluate({bool force = false}) {
    WindowSizeConfigurationData data = widget.data ?? WindowSizeConfiguration.of(context);

    WindowSize width;
    WindowSize height;

    Size size = MediaQuery.sizeOf(context);
    (width, height) = data.getWindowSize(size);

    if (force || width != _width || height != _height) {
      _width = width;
      _height = height;

      _child = widget.builder(
        context,
        width,
        height,
        widget.child,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _child;
  }
}
