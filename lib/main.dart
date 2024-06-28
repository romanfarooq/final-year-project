import 'package:car_care/screens/login_screen.dart';
import 'package:car_care/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './models/car_info.dart';
import './routes/app_routes.dart';
import './screens/car_user_signup.dart';
import './utils/theme.dart';

void main() async{



  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );
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
      // home: const SplashScreen(),
      home: const LoginScreen() ,
      routes: AppRoutes.routes,
    );
  }
}
