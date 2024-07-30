import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_ui/src/data/window_size_configuration_data.dart';
import 'package:responsive_ui/src/ui/window_size_configuration.dart';

import '../data/window_size.dart';

typedef Builder = Widget Function(WindowSize width, WindowSize height, Widget? child);

/// To define your own [WindowSize]s, insert a [WindowSizeConfiguration] in the Widget tree
class WindowSizeBuilder extends StatefulWidget {
  final FlutterView? flutterView;
  final Builder builder;
  final Widget? child;

  const WindowSizeBuilder._({super.key, this.flutterView, required this.builder, this.child});

  const WindowSizeBuilder({Key? key, required Builder builder, Widget? child}) : this._(key: key, builder: builder, child: child);

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
  State<WindowSizeBuilder> createState() => _WindowSizeBuilderState();
}

class _WindowSizeBuilderState extends State<WindowSizeBuilder> {
  WindowSize? _width;
  WindowSize? _height;

  late Widget _child;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WindowSizeConfigurationData data = WindowSizeConfiguration.of(context);


    WindowSize width;
    WindowSize height;


    Size size = MediaQuery.sizeOf(context);
    (width, height) = data.getWindowSize(size);


    if (width != _width || height != _height) {
      _width = width;
      _height = height;

      _child = widget.builder(
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
