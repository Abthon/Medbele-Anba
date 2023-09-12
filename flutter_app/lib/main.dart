import 'package:flutter/material.dart';
import 'package:flutter_app/routes/routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      title: 'Medbele Anba',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerDelegate: Routes.goRouter.routerDelegate,
      routeInformationParser: Routes.goRouter.routeInformationParser,
    );
  }
}
