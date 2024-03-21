import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../utils/image_constant.dart';

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
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(right: screenWidth * 0.25),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(236, 236, 236, 0.77),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            inset: true,
                            offset: const Offset(1, 4),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight * 0.05,
                            bottom: screenHeight * 0.05,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                ImageConstant.carOnwer,
                                height: screenHeight * 0.2,
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: screenHeight * 0.05),
                                child: const RotatedBox(
                                  quarterTurns: 1,
                                  child: Text(
                                    'CAR OWNER',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(left: screenWidth * 0.25),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(236, 236, 236, 0.77),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            inset: true,
                            offset: const Offset(-1, 4),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight * 0.05,
                            bottom: screenHeight * 0.05,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.1),
                                child: const RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    'WORKSHOP',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                ImageConstant.workshop,
                                height: screenHeight * 0.2,
                              ),
                            ],
                          ),
                        ),
                      ),
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
