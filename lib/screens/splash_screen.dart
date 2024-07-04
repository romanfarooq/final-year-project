import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';
import '../utils/image_constant.dart';
import '../models/car_info.dart';
import '../models/workshop_info.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> checkUserStatus() async {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final user = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .get();
        final workshop = await FirebaseFirestore.instance
            .collection('workshops')
            .doc(currentUser.uid)
            .get();

        if (user.exists) {
          final data = user.data() as Map<String, dynamic>;
          if (context.mounted) {
            final userCarsInfo = context.read<UserCarsInfo>();
            final workshop = context.read<Workshop>();
            userCarsInfo.setUserInfo(data);
            await userCarsInfo.fetchUserCars();
            await workshop.fetchWorkshops();
            if (userCarsInfo.getCars.isNotEmpty) {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.bottomTab,
              );
            } else {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.carUserSignup,
              );
            }
          }
        } else if (workshop.exists) {
          final data = workshop.data() as Map<String, dynamic>;
          // if (context.mounted) {
          final workshopInfo = context.read<WorkshopInfo>();
          workshopInfo.setWorkshopInfo(data);
          if (data['workshopName'] == null) {
            Navigator.of(context).pushReplacementNamed(
              AppRoutes.workshopSignupScreen,
            );
          } else {
            Navigator.of(context).pushReplacementNamed(
              AppRoutes.workhopBottomTab,
            );
          }
        }
      } else {
        await Future.delayed(const Duration(seconds: 3));
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed(
            AppRoutes.selectUserScreen,
          );
        }
      }
    }

    checkUserStatus();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: constraints.maxHeight * 0.07,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(flex: 3),
                  _buildImage(
                    ImageConstant.logo,
                    height: constraints.maxHeight * 0.25,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.04),
                  _buildImage(
                    ImageConstant.loading,
                    height: constraints.maxHeight * 0.09,
                  ),
                  const Spacer(flex: 5),
                  _buildImage(
                    ImageConstant.carcare1,
                    height: constraints.maxHeight * 0.028,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildImage(String imagePath, {required double height}) {
    return Image.asset(
      imagePath,
      height: height,
      fit: BoxFit.contain,
    );
  }
}
