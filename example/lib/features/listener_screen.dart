import 'package:example/shared/screen.dart';
import 'package:example/shared/window_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ux/responsive_ux.dart';

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
        String w = _notifier.width.toWindowSizeString();
        String h = _notifier.height.toWindowSizeString();

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

    // .check() will use fallback values if no ancestor is found while .safeCheck() returns null
    // Remove WindowSizeConfiguration Widget inside main.dart to see the difference to .safeCheck()
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
