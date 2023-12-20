import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../utils/image_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
    });

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Container(
              width: double.infinity,
              padding:
                  EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.07),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(flex: 3),
                  _buildImage(
                    ImageConstant.imgLogo11,
                    height: constraints.maxHeight * 0.25,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.04),
                  _buildImage(
                    ImageConstant.imgLoading1,
                    height: constraints.maxHeight * 0.09,
                  ),
                  const Spacer(flex: 5),
                  _buildImage(
                    ImageConstant.imgCarcare1,
                    height: constraints.maxHeight * 0.028,
                  ),
                ],
              ),
            ),
          );
        },
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
