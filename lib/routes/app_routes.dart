import 'package:flutter/material.dart';

import '../screens/billing_screen.dart';
import '../screens/car_care_requests.dart';
import '../screens/car_features.dart';
import '../screens/car_user_main_page.dart';
import '../screens/car_user_signup.dart';
import '../screens/car_user_signup_2.dart';
import '../screens/denting_n_painting_repair.dart';
import '../screens/denting_n_painting_services_vault.dart';
import '../screens/electrical_repair.dart';
import '../screens/electrical_services_vault.dart';
import '../screens/forget_screen.dart';
import '../screens/login_screen.dart';
import '../screens/login_workshop.dart';
import '../screens/mechanical_repair.dart';
import '../screens/mechanical_services_vault.dart';
import '../screens/oil_change.dart';
import '../screens/old_car_information.dart';
import '../screens/select_user_screen.dart';
import '../screens/service_history.dart';
import '../screens/signup_screen.dart';
import '../screens/signup_workshop.dart';
import '../screens/splash_screen.dart';
import '../screens/tab_screen.dart';
import '../screens/tire_repair.dart';
import '../screens/tire_services_vault.dart';
import '../screens/user_homescreen.dart';
import '../screens/vehicle_service_record.dart';
import '../screens/vehicle_service_record_repaired.dart';
import '../screens/workshop_clients.dart';
import '../screens/workshop_homepage.dart';
import '../screens/workshop_services.dart';
import '../screens/workshop_signup.dart';
import '../screens/booking_service.dart';
import '../screens/carusersetting.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String forgetScreen = '/forget_screen';
  static const String loginScreen = '/login_screen';
  static const String loginScreenW = '/login_workshop';
  static const String signUpScreen = '/sign_up_screen';
  static const String signUpScreenW = '/signup_workshop';
  static const String selectUserScreen = '/select_user_screen';
  static const String workshopSignupScreen = '/workshop_signup';
  static const String carUserSignup = '/car_user_signup';
  static const String carUserSignup2 = '/car_user_signup_2';
  static const String carFeatures = '/car_features';
  static const String billingScreen = '/billing_screen';
  static const String carCareRequests = '/car_care_requests';
  static const String dentingPaintingRepair = '/denting_painting_repair';
  static const String dentingPaintingServicesVault =
      '/denting_painting_services_vault';
  static const String electricalRepair = '/electrical_repair';
  static const String electricalServicesVault = '/electrical_services_vault';
  static const String mechanicalRepair = '/mechanical_repair';
  static const String mechanicalServicesVault = '/mechanical_services_vault';
  static const String oilChange = '/oil_change';
  static const String serviceHistory = '/service_history';
  static const String tireRepair = '/tire_repair';
  static const String tireServicesVault = '/tire_services_vault';
  static const String vehicleServiceRecord = '/vehicle_service_record';
  static const String vehicleServiceRecordRepaired =
      '/vehicle_service_record_repaired';
  static const String workshopClients = '/workshop_clients';
  static const String workshopHomepage = '/workshop_homepage';
  static const String workshopServices = '/workshop_services';
  static const String carUserMain = '/car_user_main';
  static const String userHomeScreen = '/user_homescreen';
  static const String bottomTab = '/bottom_tab';
  static const String oldCarInformation = '/old_car_information';
  static const String bookingService = '/booking_service';
  static const String accountSettings = '/account_settings';

  static Map<String, WidgetBuilder> routes = {
    forgetScreen: (ctx) => const ForgetScreen(),
    splashScreen: (ctx) => const SplashScreen(),
    loginScreen: (ctx) => const LoginScreen(),
    loginScreenW: (ctx) => const LoginScreenW(),
    signUpScreen: (ctx) => const SignUpScreen(),
    signUpScreenW: (ctx) => const SignUpScreenW(),
    selectUserScreen: (ctx) => const SelectUserScreen(),
    workshopSignupScreen: (ctx) => const WorkshopSignup(),
    carUserSignup: (ctx) => const CarUserSignup(),
    carUserSignup2: (ctx) => const CarUserSignup2(),
    carFeatures: (ctx) => const CarFeatures(),
    billingScreen: (ctx) => const BillingScreen(),
    carCareRequests: (ctx) => const CarCareRequests(),
    dentingPaintingRepair: (ctx) => const DentingNpaintingRepair(),
    dentingPaintingServicesVault: (ctx) => const DentingNpaintingServiceVault(),
    electricalRepair: (ctx) => const ElectricalRepair(),
    electricalServicesVault: (ctx) => const ElectricalServiceVault(),
    mechanicalRepair: (ctx) => const MechanicalRepair(),
    mechanicalServicesVault: (ctx) => const MechanicalServiceVault(),
    oilChange: (ctx) => const OilChange(),
    serviceHistory: (ctx) => const ServiceHistory(),
    tireRepair: (ctx) => const TireRepair(),
    tireServicesVault: (ctx) => const TireServiceVault(),
    vehicleServiceRecord: (ctx) => const VehicleServicRecord(),
    vehicleServiceRecordRepaired: (ctx) => const VehicleServiceRecordRepaired(),
    workshopClients: (ctx) => const WorkshopClients(),
    workshopHomepage: (ctx) => const WorkshopHomepage(),
    workshopServices: (ctx) => const WorkshopServices(),
    userHomeScreen: (ctx) => const UserHomeScreen(),
    carUserMain: (ctx) => const CarUserMain(),
    bottomTab: (ctx) => const BottomTabs(),
    oldCarInformation: (ctx) => const OldCarInformation(),
    bookingService: (ctx) => const BookingService(),
    accountSettings: (ctx) => const AccountSettingsScreen(),
  };
}
