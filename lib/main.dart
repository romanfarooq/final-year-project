import 'package:flutter/material.dart';

import './routes/app_routes.dart';
import './screens/splash_screen.dart';
import './utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Care Pro',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const SplashScreen(),
      routes: AppRoutes.routes,
    );
  }
}
