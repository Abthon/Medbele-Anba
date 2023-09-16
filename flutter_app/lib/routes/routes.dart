import 'package:flutter/material.dart';
import 'package:flutter_app/screens/onboarding/onboarding_screen.dart';
import '../screens/authentication/views/login.dart';
import '../screens/authentication/views/signup.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final goRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
          child: OnBoardingScreen(),
        ),
      ),
      GoRoute(
        path: '/signUp',
        pageBuilder: (context, state) => const MaterialPage(child: SignUp()),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => const MaterialPage(child: Login()),
      ),
      // GoRoute(path: '/home', builder: (context, state) => App())
    ],
  );
}
