import 'package:example/util/screen.dart';
import 'package:example/util/window_size_extension.dart';
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
