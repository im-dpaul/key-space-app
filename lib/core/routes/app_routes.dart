import 'package:go_router/go_router.dart';
import 'package:chucker_flutter/chucker_flutter.dart';

import 'package:key_space_app/core/routes/routes_list.dart';
import 'package:key_space_app/features/home/home_screen.dart';
import 'package:key_space_app/features/splash/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: RoutesList.initialRoute,
  errorBuilder: (context, state) => const SplashScreen(),
  observers: [ChuckerFlutter.navigatorObserver],
  routes: [
    GoRoute(
      path: RoutesList.initialRoute,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),

    GoRoute(
      path: RoutesList.home,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
);
