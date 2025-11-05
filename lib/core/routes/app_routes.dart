import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chucker_flutter/chucker_flutter.dart';

import 'package:key_space_app/core/routes/routes_list.dart';
import 'package:key_space_app/core/routes/routes_names.dart';
import 'package:key_space_app/data/repositories/onboarding_repository.dart';
import 'package:key_space_app/features/home/home_screen.dart';
import 'package:key_space_app/features/splash/splash_cubit.dart';
import 'package:key_space_app/features/splash/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: RoutesList.initialRoute,
  errorBuilder: (context, state) => const SplashScreen(),
  observers: [ChuckerFlutter.navigatorObserver],
  routes: [
    GoRoute(
      path: RoutesList.initialRoute,
      builder: (context, state) {
        return BlocProvider(
          create: (BuildContext context) {
            return SplashCubit(OnboardingRepository())..init();
          },
          child: const SplashScreen(),
        );
      },
    ),

    GoRoute(
      name: RoutesNames.home,
      path: RoutesList.home,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
);
