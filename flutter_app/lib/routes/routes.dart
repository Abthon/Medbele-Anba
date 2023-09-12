import 'package:flutter/material.dart';
import '../screens/authentication/views/login.dart';
import '../screens/authentication/views/signup.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final goRouter = GoRouter(
    initialLocation: '/signUp',
    routes: [
      GoRoute(
        path: '/signUp',
        pageBuilder: (context, state) => const MaterialPage(child: SignUp()),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const Login(),
      ),
      // GoRoute(path: '/home', builder: (context, state) => App())
    ],
  );
}
