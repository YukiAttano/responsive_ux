// ignore_for_file: prefer_const_constructors
import 'package:example/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_ux/responsive_ux.dart';

void main() {
  runApp(
    const ProviderScope(child: ResponsiveUi()),
  );
}

class ResponsiveUi extends ConsumerWidget {
  const ResponsiveUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(router),
      builder: (context, child) {
        return WindowSizeConfiguration(
          data: WindowSizeConfigurationData.material(),
          child: child!,
        );
      },
    );
  }
}
