import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../utils/image_constant.dart';
import '../widgets/select_user_item.dart';

class SelectUserScreen extends StatelessWidget {
  const SelectUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Expanded(
          child: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.background),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  ImageConstant.carcare2,
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Spacer(),
                      SelectUserItem(
                        userType: 'Car Owner',
                        quarterTurns: 1,
                        offset: const Offset(1, 4),
                        alignment: Alignment.topLeft,
                        imageHeight: screenHeight * 0.2,
                        textPadding: EdgeInsets.only(right: screenWidth * 0.1),
                        inkWellPadding: EdgeInsets.only(
                          top: screenHeight * 0.05,
                          bottom: screenHeight * 0.05,
                        ),
                        margin: EdgeInsets.only(right: screenWidth * 0.25),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.loginScreen);
                        },
                      ),
                      const Spacer(flex: 5),
                      SelectUserItem(
                        userType: 'Workshop',
                        quarterTurns: 3,
                        offset: const Offset(-1, 4),
                        alignment: Alignment.bottomRight,
                        imageHeight: screenHeight * 0.2,
                        textPadding: EdgeInsets.only(left: screenWidth * 0.1),
                        inkWellPadding: EdgeInsets.only(
                          top: screenHeight * 0.05,
                          bottom: screenHeight * 0.05,
                        ),
                        margin: EdgeInsets.only(left: screenWidth * 0.25),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.loginScreenW);
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Image.asset(
                  ImageConstant.carcare1,
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
