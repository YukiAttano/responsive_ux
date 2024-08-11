import 'package:example/util/screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ux/responsive_ux.dart';

class LocalScreen extends StatelessWidget {
  const LocalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      title: "Local Provided Config",
      child: ColoredBox(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Center(
          child: WindowSizeBuilder.override(
            data: WindowSizeConfigurationData(sizes: [
              const WindowSize(100, 100),
              const WindowSize(800, 200),
            ]),
            builder: (context, width, height, child) {

              return SizedBox(
                height: height.height,
                width: width.width,
                child: child!,
              );
            },
            child: ColoredBox(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
