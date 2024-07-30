import 'package:flutter/material.dart';
import 'package:responsive_ui/responsive_ux.dart';

class BuilderScreen extends StatelessWidget {
  const BuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WindowSizeBuilder(
          builder: (width, height, child) {
            String w = "";
            String h = "";

            switch (width) {
              case WindowSizes.compact:
                w = "Compact";
              case WindowSizes.medium:
                w = "Medium";
              case WindowSizes.expanded:
                w = "Expanded";
            }

            switch (height) {
              case WindowSizes.compact:
                h = "Compact";
              case WindowSizes.medium:
                h = "Medium";
              case WindowSizes.expanded:
                h = "Expanded";
            }

            return Text("W: $w\nH: $h");
          },
        ),
      ),
    );
  }
}
