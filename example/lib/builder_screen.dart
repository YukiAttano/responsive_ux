import 'package:example/util/screen.dart';
import 'package:example/util/window_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ux/responsive_ux.dart';

class BuilderScreen extends StatelessWidget {
  const BuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      title: "Builder Screen",
      child: WindowSizedBox(
        builder: (context, width, height, child) {
          String w = width.toWindowSizeString();
          String h = height.toWindowSizeString();

          return Text("W: $w\nH: $h");
        },
      ),
    );
  }
}
