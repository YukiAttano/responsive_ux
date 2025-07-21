import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

bool isMaterialApp(BuildContext context) => context.findAncestorWidgetOfExactType<MaterialApp>() != null;

bool isCupertinoApp(BuildContext context) => context.findAncestorWidgetOfExactType<CupertinoApp>() != null;
