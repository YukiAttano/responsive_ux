import 'package:example/util/screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ui/responsive_ux.dart';

class ListenerScreen extends StatefulWidget {
  const ListenerScreen({super.key});

  @override
  State<ListenerScreen> createState() => _ListenerScreenState();
}

class _ListenerScreenState extends State<ListenerScreen> {
  final WindowSizeNotifier _notifier = WindowSizeNotifier();

  String width = "";
  String height = "";

  @override
  void initState() {
    super.initState();

    _notifier.addListener(
      () {
        String w = "";
        String h = "";

        switch (_notifier.width) {
          case WindowSizes.compact:
            w = "Compact";
          case WindowSizes.medium:
            w = "Medium";
          case WindowSizes.expanded:
            w = "Expanded";
          case null:
            w = "null";
        }

        switch (_notifier.height) {
          case WindowSizes.compact:
            h = "Compact";
          case WindowSizes.medium:
            h = "Medium";
          case WindowSizes.expanded:
            h = "Expanded";
          case null:
            h = "null";
        }

        setState(() {
          width = w;
          height = h;
        });
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _notifier.check(context);
    // Remove WindowSizeConfiguration Widget inside main.dart to see the difference
    //_notifier.safeCheck(context);
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      title: 'Listener Screen',
      child: Text("W: $width\nH: $height"),
    );
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }
}
