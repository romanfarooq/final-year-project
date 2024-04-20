
import 'package:car_care/screens/car_care_requests.dart';
import 'package:car_care/screens/vehicle_service_record.dart';
import 'package:car_care/screens/workshop_homepage.dart';
import 'package:car_care/screens/workshop_services.dart';
import 'package:car_care/screens/workshop_signup.dart';

import 'package:flutter/material.dart';

import './screens/workshop_signup.dart';
import './routes/app_routes.dart';

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
      home: const CarCareRequests(),
      routes: AppRoutes.routes,
    );
  }
}
