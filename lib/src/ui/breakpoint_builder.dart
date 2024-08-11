import 'package:flutter/material.dart';
import 'package:responsive_ux/src/data/breakpoint.dart';

typedef BpBuilder = Widget Function(BuildContext context, Breakpoint breakpoint, Widget? child);

class BreakpointBuilder extends StatefulWidget {
  final List<Breakpoint> breakpoints;
  final BpBuilder builder;
  final Widget? child;

  const BreakpointBuilder._({super.key, required this.breakpoints, required this.builder, this.child})
      : assert(breakpoints.length != 0, "No breakpoint defined, You must define at least one Breakpoint");

  /// Rebuilds if a [Breakpoint] is changed according to [Breakpoint.of]
  const BreakpointBuilder({Key? key, required List<Breakpoint> breakpoints, required BpBuilder builder, Widget? child})
      : this._(key: key, breakpoints: breakpoints, builder: builder, child: child);

  @override
  State<BreakpointBuilder> createState() => _BreakpointBuilderState();
}

class _BreakpointBuilderState extends State<BreakpointBuilder> {
  @override
  Widget build(BuildContext context) {
    Size maxSize;
    Breakpoint breakpoint;

    Breakpoint? last;
    Widget? child;

    return LayoutBuilder(
      builder: (context, constraints) {
        maxSize = Size(constraints.maxWidth, constraints.maxHeight);
        breakpoint = Breakpoint.of(maxSize, widget.breakpoints);

        if (breakpoint != last) {
          last = breakpoint;

          child = widget.builder(context, breakpoint, widget.child);
        }

        return child!;
      },
    );
  }
}
