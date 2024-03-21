import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/select_user_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String loginScreen = '/login_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String selectUserScreen = '/select_user_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    signUpScreen: (context) => SignUpScreen(),
    selectUserScreen: (context) => const SelectUserScreen(),
  };
}
