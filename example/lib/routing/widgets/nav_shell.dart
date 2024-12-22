import 'package:example/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavShell extends StatelessWidget {
  final GoRouterState state;
  final Widget child;

  const NavShell({super.key, required this.state, required this.child});

  @override
  Widget build(BuildContext context) {
    NavTarget target = NavTarget.fromRoute(state.uri.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(target.title),
        leading: Visibility(
          visible: target != initTarget,
          child: BackButton(
            onPressed: () => GoRouter.of(context).go(initTarget.route),
          ),
        ),
        actions: [
          Visibility(
            visible: target.description.isNotEmpty,
            child: Tooltip(
              triggerMode: TooltipTriggerMode.tap,
              message: target.description,
              showDuration: const Duration(seconds: 5),
              child: const Icon(Icons.info),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: child,
      ),
    );
  }
}
