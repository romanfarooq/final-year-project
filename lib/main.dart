import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bidding_info.dart';
import '../screens/splash_screen.dart';
import './firebase_options.dart';
import './models/car_info.dart';
import './models/workshop_info.dart';
import './routes/app_routes.dart';
import './utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserCarsInfo()),
        ChangeNotifierProvider(create: (_) => WorkshopInfo()),
        ChangeNotifierProvider(create: (_) => Workshops()),
        ChangeNotifierProvider(create: (_) => BiddingInfo()),
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
