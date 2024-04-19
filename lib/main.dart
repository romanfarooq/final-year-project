import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/car_user_explor.dart';
import './screens/car_user_main_page.dart';
import './screens/car_user_profile.dart';
import './screens/tab_screen.dart';
import './routes/app_routes.dart';
import './screens/carusersetting.dart';
//import './screens/splash_screen.dart';
import '../models/car_info.dart';

void main() {
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserCarsInfo()),
    ],
    child: const MyApp(),
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
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomTabs(),
      routes: AppRoutes.routes,
    );
  }
}
