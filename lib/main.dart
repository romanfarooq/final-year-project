import 'package:car_care/screens/workshop_signup.dart';
import 'package:flutter/material.dart';

import './routes/app_routes.dart';
import './screens/splash_screen.dart';
//Welcome to waqar gujjar branch
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WorkshopSignup(),
      routes: AppRoutes.routes,
    );
  }
}
