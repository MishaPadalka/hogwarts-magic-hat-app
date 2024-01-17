import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hogwarts_magic_hat_app/presentation/screens/home_screen/home_screen.dart';
import 'package:hogwarts_magic_hat_app/presentation/screens/home_screen/home_screen_cubit/home_screen_cubit.dart';
import 'package:hogwarts_magic_hat_app/presentation/screens/splash_screen/splash_screen_cubit/splash_screen_cubit.dart';

import 'router_export.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeKey = GlobalKey<NavigatorState>();
final _listKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          name: RoutePath.splash,
          pageBuilder: (context, state) {
            return MaterialPage(
              child: BlocProvider(
                create: (context) => GetIt.instance.get<SplashScreenCubit>(),
                child: const SplashScreen(),
              ),
            );
          },
          routes: [
            StatefulShellRoute.indexedStack(
              pageBuilder: (
                BuildContext context,
                GoRouterState state,
                StatefulNavigationShell navigationShell,
              ) {
                return MaterialPage(
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => GetIt.instance.get<HomeScreenCubit>(),
                      ),
                    ],
                    child: ScaffoldWithBottomBar(
                      navigationShell: navigationShell,
                    ),
                  ),
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
                StatefulShellBranch(
                  navigatorKey: _listKey,
                  routes: <RouteBase>[
                    GoRoute(
                      path: RoutePath.list,
                      name: RoutePath.list,
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
  static String list = 'listScreen';
}
