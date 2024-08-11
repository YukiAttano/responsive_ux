import 'package:example/util/screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ux/responsive_ux.dart';

class BreakpointScreen extends StatelessWidget {
  const BreakpointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      title: "Breakpoint Builder",
      child: Center(
        child: BreakpointBuilder(
          breakpoints: [
            Breakpoint(0, 0),
            Breakpoint(10, 10),
            Breakpoint(100, 100),
            Breakpoint(200, 200),
            Breakpoint(300, 250),
            Breakpoint(300, 300),
            Breakpoint(400, 400),
            Breakpoint(500, 400),
            Breakpoint(600, 400),
            Breakpoint(600, 500),
            Breakpoint(600, 600),
            Breakpoint(600, 700),
            Breakpoint(600, 800),
          ],
          builder: (context, breakpoint, child) {
            return ColoredBox(
              color: Colors.red,
              child: SizedBox(
                width: breakpoint.width,
                height: breakpoint.height,
                child: Text(breakpoint.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
