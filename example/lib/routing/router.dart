import 'package:example/features/breakpoint_screen.dart';
import 'package:example/features/breakpoint_separated_screen.dart';
import 'package:example/features/builder_screen.dart';
import 'package:example/features/listener_screen.dart';
import 'package:example/routing/widgets/menu_screen.dart';
import 'package:example/routing/widgets/nav_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

NavTarget initTarget = NavTarget.MENU;

final router = Provider(
  (ref) {
    return GoRouter(
      initialLocation: initTarget.route,
      redirect: (context, state) {
        if (state.uri.toString().isEmpty || state.uri.toString() == "/") {
          return initTarget.route;
        }
      },
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return NavShell(state: state, child: child);
          },
          routes: [
            GoRoute(
              path: NavTarget.MENU.route,
              builder: (context, state) {
                return const MenuScreen();
              },
            ),
            GoRoute(
              path: NavTarget.BREAKPOINT.route,
              builder: (context, state) {
                return const BreakpointScreen();
              },
            ),
            GoRoute(
              path: NavTarget.SEPARATED.route,
              builder: (context, state) {
                return const BreakpointSeparatedScreen();
              },
            ),
            GoRoute(
              path: NavTarget.BUILDER.route,
              builder: (context, state) {
                return const BuilderScreen();
              },
            ),
            GoRoute(
              path: NavTarget.LISTENER.route,
              builder: (context, state) {
                return const ListenerScreen();
              },
            ),

          ],
        ),
      ],
    );
  },
);

enum NavTarget {
  MENU("/menu", "Menu", ""),
  BREAKPOINT("/breakpoint", "Breakpoint",
      "Change the window size to see how a local Breakpoint override works."),
  SEPARATED("/separated", "Separated",
      "Change the window size to see how two separated widgets react to changes"),
  BUILDER("/builder", "Builder", "Change the window size to see the current size according to the global configuration"),
  LISTENER("/listener", "Listener", "Change the window size to see the current size according to the global configuration"),
  ;

  const NavTarget(this.route, this.title, this.description);

  final String route;
  final String title;
  final String description;

  static NavTarget fromRoute(String route) {
    for (var r in values) {
      if (r.route == route) {
        return r;
      }
    }

    return MENU;
  }

  Future<void> navigate(BuildContext context) {
    return GoRouter.of(context).push(route);
  }
}
