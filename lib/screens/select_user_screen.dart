import 'package:flutter/material.dart';

import '../utils/image_constant.dart';
import '../widgets/select_user_item.dart';

class SelectUserScreen extends StatelessWidget {
  const SelectUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
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
                    SelectUserItem(
                      userType: 'Car Owner',
                      quarterTurns: 1,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      offset: const Offset(1, 4),
                      onTap: () {},
                    ),
                    const Spacer(),
                    SelectUserItem(
                      userType: 'Workshop',
                      quarterTurns: 3,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      offset: const Offset(-1, 4),
                      onTap: () {},
                    ),
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
    );
  }
}
