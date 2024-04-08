import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../utils/image_constant.dart';

class AddingCar1Screen extends StatelessWidget {
  const AddingCar1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final padding = MediaQuery.of(context).padding;
    final screenHeight = height - padding.top - padding.bottom;
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        height: screenHeight * 0.2,
        title: Image.asset(
          ImageConstant.carcare1,
          height: screenHeight * 0.05,
        ),
      ),
      body: Column(
        children: [
          const Text('Adding a car'),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
