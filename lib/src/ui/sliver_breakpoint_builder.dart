import "package:flutter/material.dart";
import "../../responsive_ux.dart";
import "../data/breakpoint.dart";

/// The same as [BreakpointBuilder] but expects to build Slivers
class SliverBreakpointBuilder extends BreakpointBuilder {

  /// Rebuilds if another [Breakpoint] is hit according to [Breakpoint.of]
  const SliverBreakpointBuilder({super.key, required super.breakpoints, required super.builder, super.child});

  @override
  State<SliverBreakpointBuilder> createState() => _SliverBreakpointBuilderState();
}

class _SliverBreakpointBuilderState extends State<SliverBreakpointBuilder> {
  @override
  Widget build(BuildContext context) {
    Size maxSize;
    Breakpoint breakpoint;

    Breakpoint? last;
    Widget? sliver;

    return SliverLayoutBuilder(
      builder: (context, constraints) {
        maxSize = constraints.asBoxConstraints().biggest;
        breakpoint = Breakpoint.of(maxSize, widget.breakpoints);

        if (breakpoint != last) {
          last = breakpoint;

          sliver = widget.builder(context, breakpoint, widget.child);
        }

        return sliver!;
      },
    );
  }
}
