import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/car_info.dart';
import './routes/app_routes.dart';
import './screens/splash_screen.dart';
import './utils/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserCarsInfo()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
