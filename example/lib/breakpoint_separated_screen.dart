import 'package:example/util/screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ux/responsive_ux.dart';

class BreakpointSeparatedScreen extends StatelessWidget {
  const BreakpointSeparatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Screen(
      title: "Breakpoint Builder with either width or height",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ColoredBox(
              color: Colors.red,
              child: _WidthExample(),
            ),
          ),
          VerticalDivider(),
          Flexible(
            child: ColoredBox(
              color: Colors.red,
              child: _HeightExample(),
            ),
          )
        ],
      ),
    );
  }
}

class _WidthExample extends StatelessWidget {
  const _WidthExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BreakpointBuilder(
      breakpoints: const [
        Breakpoint.width(0),
        Breakpoint.width(20),
        Breakpoint.width(50),
        Breakpoint.width(100),
        Breakpoint.width(200),
        Breakpoint.width(400),
        Breakpoint.width(500),
        Breakpoint.width(600),
      ],
      builder: (context, breakpoint, child) {
        return SizedBox(
          width: breakpoint.width,
          height: 100,
        );
      },
    );
  }
}

class _HeightExample extends StatelessWidget {
  const _HeightExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BreakpointBuilder(
      breakpoints: [
        Breakpoint.height(0),
        Breakpoint.height(20),
        Breakpoint.height(50),
        Breakpoint.height(100),
        Breakpoint.height(200),
        Breakpoint.height(400),
        Breakpoint.height(500),
        Breakpoint.height(600),
      ],
      builder: (context, breakpoint, child) {
        return SizedBox(
          width: 50,
          height: breakpoint.height,
        );
      },
    );
  }
}
