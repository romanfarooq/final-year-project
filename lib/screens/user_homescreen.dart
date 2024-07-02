import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../routes/app_routes.dart';
import '../models/car_info.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final userInfo = context.read<UserCarsInfo>();
    final car = userInfo.getSelectedCar;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: figmaSpaceToPercentage(450, context),
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      // 'assets/images/altis.png',
                      car.imgPath,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: figmaSpaceToPercentage(
                350,
                context,
              ), // This value should be less than the height of the first container to overlap
              left: 0,
              right: 0,
              child: Container(
                height: figmaSpaceToPercentage(510, context),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(243, 243, 243, 1),
                  borderRadius: BorderRadius.circular(
                    35,
                  ), // Set border radius for rounded corners
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: figmaSpaceToPercentage(30, context),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(33, context),
                        ),
                        Text(
                          car.model,
                          style: TextStyle(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: figmaSpaceToPercentage(24, context),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: figmaSpaceToPercentage(30, context),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(33, context),
                        ),
                        Container(
                          height: figmaSpaceToPercentage(142, context),
                          width: figmaSpaceToPercentageWidth(118, context),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(
                              20,
                            ), // Set border radius for rounded corners
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: figmaSpaceToPercentage(5, context),
                              ),
                              Image.asset(
                                ImageConstant.carwheel,
                                height: figmaSpaceToPercentage(70, context),
                                width:
                                    figmaSpaceToPercentageWidth(100, context),
                                alignment: Alignment.center,
                              ),
                              SizedBox(
                                height: figmaSpaceToPercentage(0.1, context),
                              ),
                              Text(
                                NumberFormat.decimalPattern().format(
                                  car.distanceTravelled,
                                ),
                                style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize:
                                        figmaSpaceToPercentage(19, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                'KM Driven',
                                style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize:
                                        figmaSpaceToPercentage(14, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(10, context),
                        ),
                        Container(
                          height: figmaSpaceToPercentage(142, context),
                          width: figmaSpaceToPercentageWidth(118, context),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(
                              20,
                            ), // Set border radius for rounded corners
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: figmaSpaceToPercentage(5, context),
                              ),
                              Image.asset(
                                ImageConstant.oilchange,
                                height: figmaSpaceToPercentage(70, context),
                                width:
                                    figmaSpaceToPercentageWidth(100, context),
                                alignment: Alignment.center,
                              ),
                              SizedBox(
                                height: figmaSpaceToPercentage(0.1, context),
                              ),
                              Text(
                                NumberFormat.decimalPattern().format(
                                  car.lastOilChangeDistance,
                                ),
                                style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize:
                                        figmaSpaceToPercentage(19, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                'Last Oil Change',
                                style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize:
                                        figmaSpaceToPercentage(13, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(10, context),
                        ),
                        Container(
                          height: figmaSpaceToPercentage(142, context),
                          width: figmaSpaceToPercentageWidth(118, context),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(
                              20,
                            ), // Set border radius for rounded corners
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: figmaSpaceToPercentage(5, context),
                              ),
                              Image.asset(
                                ImageConstant.caruser,
                                height: figmaSpaceToPercentage(70, context),
                                width:
                                    figmaSpaceToPercentageWidth(100, context),
                                alignment: Alignment.center,
                              ),
                              SizedBox(
                                height: figmaSpaceToPercentage(0.1, context),
                              ),
                              Text(
                                car.year.toString(),
                                style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize:
                                        figmaSpaceToPercentage(19, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                'Year',
                                style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize:
                                        figmaSpaceToPercentage(13, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: figmaSpaceToPercentage(45, context),
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.serviceHistory,
                          );
                        },
                        child: Container(
                          height: figmaSpaceToPercentage(60, context),
                          width: figmaSpaceToPercentageWidth(368, context),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(
                              38,
                            ), // Set border radius for rounded corners
                          ),
                          child: Center(
                            child: Text(
                              'Service History',
                              style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: figmaSpaceToPercentage(23, context),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: figmaSpaceToPercentage(18, context),
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          // print('hi');
                        },
                        child: Container(
                          height: figmaSpaceToPercentage(60, context),
                          width: figmaSpaceToPercentageWidth(368, context),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(
                              38,
                            ), // Set border radius for rounded corners
                          ),
                          child: Center(
                            child: Text(
                              'Book A Service',
                              style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: figmaSpaceToPercentage(23, context),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: figmaSpaceToPercentage(
                280,
                context,
              ), // 250 (top of container 2) - 30 pixels
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: figmaSpaceToPercentageWidth(33, context),
                    ),
                    child: Text(
                      userInfo.getName ?? '',
                      style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: figmaSpaceToPercentage(22, context),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: figmaSpaceToPercentageWidth(33, context),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          // print('hi');
                        },
                        child: Container(
                          height: figmaSpaceToPercentage(52, context),
                          width: figmaSpaceToPercentageWidth(52, context),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(217, 217, 217, 1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.settings,
                            color: Colors.black,
                            size: figmaSpaceToPercentage(40, context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
