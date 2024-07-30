// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:responsive_ui/responsive_ux.dart';

import 'builder_screen.dart';

void main() {
  runApp(const ResponsiveUi());
}

class ResponsiveUi extends StatelessWidget {
  const ResponsiveUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WindowSizeConfiguration(
        /*
          data: WindowSizeConfigurationData(
          sizes: [WindowSizes.compact]
        ),*/
        child: BuilderScreen(),
      ),
    );
  }
}
