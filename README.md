<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Library to create Responsive UI more easily

The current state is under active development and might change heavily until the first stable release.
Feel free to reach out on GitHub

## Features

- Implementation of (Jetpack Compose) [WindowSizeClass](https://developer.android.com/develop/ui/compose/layouts/adaptive/window-size-classes?hl=de)
- Implementation of (Apple) [UserInterfaceSizeClass](https://anvilproject.org/guides/content/creating-links)
- Implementation of (Material) [WindowSizeClass](https://m3.material.io/foundations/layout/applying-layout/window-size-classes#2bb70e22-d09b-4b73-9c9f-9ef60311ccc8)

You can also easily create your own Layout bounds.

## Getting started

```terminal
dart pub add responsive_ux
```

## Usage

(see /example folder for a working example and different use cases)

```dart
MaterialApp(
    // WindowSizeConfiguration must only be injected for custom boundaries, otherwise defaults are used (check documentation)
    home: WindowSizeConfiguration(
      data: WindowSizeConfigurationData(
      sizes: [WindowSizes.compact]
    ),
    child: BuilderScreen(),
  ),
);
```

```dart
WindowSizeBuilder(
  builder: (width, height, child) {
    String w = "";
    String h = "";

    switch (width) {
      case WindowSizes.compact:
        w = "Compact";
      case WindowSizes.medium:
        w = "Medium";
      case WindowSizes.expanded:
        w = "Expanded";
    }

    switch (height) {
      case WindowSizes.compact:
        h = "Compact";
      case WindowSizes.medium:
        h = "Medium";
      case WindowSizes.expanded:
        h = "Expanded";
    }
    
    print(width.width);   // The WindowSize width boundary that is matched
    print(height.height); // The WindowSize height boundary that is matched

    return Text("W: $w\nH: $h");
  },
);
```

## Additional information

This package has been developed as Flutter does not has an [implementation](https://github.com/flutter/flutter/issues/142343?notification_referrer_id=NT_kwDOBRti3rM5MjMzODYxOTQyOjg1NjgwODYy) right now

As the name suggests, we are open for ideas and do not limit this package on what there currently is. 
Every improvement can be requested and contributed on GitHub.
