import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hogwarts_magic_hat_app/presentation/screens/home_screen/home_screen.dart';

import 'router_export.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          name: RoutePath.splash,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SplashScreen(),
            );
          },
          routes: [
            StatefulShellRoute.indexedStack(
              pageBuilder: (
                BuildContext context,
                GoRouterState state,
                StatefulNavigationShell navigationShell,
              ) {
                return const MaterialPage(
                  child: ScaffoldWithBottomBar(),
                );
              },
              branches: [
                StatefulShellBranch(
                  navigatorKey: _homeKey,
                  routes: <RouteBase>[
                    GoRoute(
                      path: RoutePath.home,
                      name: RoutePath.home,
                      builder: (context, state) {
                        return HomeScreen(
                          key: state.pageKey,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ]),
    ]);

class RoutePath {
  static String splash = 'splashScreen';
  static String home = 'homeScreen';
}
