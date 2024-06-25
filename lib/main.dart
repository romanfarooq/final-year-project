import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/adding_car_1.dart';
import './routes/app_routes.dart';
// import './screens/splash_screen.dart';
import './utils/theme.dart';
import './models/car_info.dart';
import './screens/tab_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddingCar1()),
        ChangeNotifierProvider(create: (_) => UserCarsInfo()),
      ],
      child: const MyApp(),
    ),
  );
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
      // home: const SplashScreen(),
      home: const BottomTabs(),
      routes: AppRoutes.routes,
    );
  }
}
