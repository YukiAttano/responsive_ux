import 'package:example/routing/router.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static const List<NavTarget> _targets = [
    NavTarget.BREAKPOINT,
    NavTarget.SEPARATED,
    NavTarget.BUILDER,
    NavTarget.LISTENER,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("To understand the differences, take a look at the code"),
        const Divider(color: Colors.transparent),
        Expanded(
          child: ListView(
            children: List.generate(
              _targets.length,
              (index) {
                NavTarget t = _targets[index];

                return _MenuEntry(target: t);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuEntry extends StatelessWidget {
  final NavTarget target;

  const _MenuEntry({super.key, required this.target});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _goto(context),
      child: Text(target.title),
    );
  }

  void _goto(BuildContext context) {
    target.navigate(context);
  }
}
