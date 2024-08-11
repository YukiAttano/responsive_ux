// ignore_for_file: prefer_const_constructors
import 'package:example/breakpoint_screen.dart';
import 'package:example/breakpoint_separated_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ux/responsive_ux.dart';

import 'builder_screen.dart';
import 'listener_screen.dart';

void main() {
  runApp(const ResponsiveUi());
}

class ResponsiveUi extends StatelessWidget {
  const ResponsiveUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WindowSizeConfiguration.adaptive(
        platform: Theme.of(context).platform,
        /*
          data: WindowSizeConfigurationData(
          sizes: [WindowSizes.compact]
        ),*/
        child:
          BuilderScreen(),
          //ListenerScreen(),
          //BreakpointScreen(),
          //BreakpointSeparatedScreen(),
      ),
    );
  }
}
