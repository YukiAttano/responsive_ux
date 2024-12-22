import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;

  const Screen({super.key, required this.title, this.description = "", required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            Visibility(
              visible: description.isNotEmpty,
              child: Text(description),
            ),
            const SizedBox(height: 20),
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}
