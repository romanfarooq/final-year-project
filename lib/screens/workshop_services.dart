import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../routes/app_routes.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';

class WorkshopServices extends StatelessWidget {
  const WorkshopServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: figmaSpaceToPercentageHeight(30, context),
                  ),
                  Center(
                    child: Image.asset(
                      ImageConstant.carcare1,
                      height: 29,
                      width: 106,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentageHeight(50, context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.electricalServicesVault,
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(40, context),
                        ),
                        Container(
                          width: figmaSpaceToPercentageWidth(159, context),
                          height: figmaSpaceToPercentageHeight(150, context),
                          padding: const EdgeInsets.only(left: 1),
                          margin: const EdgeInsets.only(left: 1),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(236, 236, 236, 0.77),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 5,
                                inset: true,
                                offset: const Offset(1, 4),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            ImageConstant.electricalrepairs,
                            height: figmaSpaceToPercentageHeight(150, context),
                            width: figmaSpaceToPercentageWidth(159, context),
                          ),
                        ),
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(26, context),
                        ),
                        Text(
                          "Electrical\nRepairs",
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: figmaSpaceToPercentageHeight(23, context),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.5, // Set line height multiplier
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentageHeight(25, context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.mechanicalServicesVault,
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(40, context),
                        ),
                        Container(
                          width: figmaSpaceToPercentageWidth(159, context),
                          height: figmaSpaceToPercentageHeight(150, context),
                          padding: const EdgeInsets.only(left: 1),
                          margin: const EdgeInsets.only(left: 1),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(236, 236, 236, 0.77),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 5,
                                inset: true,
                                offset: const Offset(1, 4),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            ImageConstant.mechanical,
                            height: figmaSpaceToPercentageHeight(150, context),
                            width: figmaSpaceToPercentageWidth(159, context),
                          ),
                        ),
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(26, context),
                        ),
                        Text(
                          "Mechanical\nRepairs",
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: figmaSpaceToPercentageHeight(23, context),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.5, // Set line height multiplier
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentageHeight(25, context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.dentingPaintingServicesVault,
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(40, context),
                        ),
                        Container(
                          width: figmaSpaceToPercentageWidth(159, context),
                          height: figmaSpaceToPercentageHeight(150, context),
                          padding: const EdgeInsets.only(left: 1),
                          margin: const EdgeInsets.only(left: 1),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(236, 236, 236, 0.77),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 5,
                                inset: true,
                                offset: const Offset(1, 4),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            ImageConstant.dentingNpainting,
                            height: figmaSpaceToPercentageHeight(150, context),
                            width: figmaSpaceToPercentageWidth(159, context),
                          ),
                        ),
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(26, context),
                        ),
                        Text(
                          "Denting &\nPainting",
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: figmaSpaceToPercentageHeight(23, context),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.5, // Set line height multiplier
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentageHeight(25, context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.tireServicesVault,
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(40, context),
                        ),
                        Container(
                          width: figmaSpaceToPercentageWidth(159, context),
                          height: figmaSpaceToPercentageHeight(150, context),
                          padding: const EdgeInsets.only(left: 1),
                          margin: const EdgeInsets.only(left: 1),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(236, 236, 236, 0.77),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 5,
                                inset: true,
                                offset: const Offset(1, 4),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            ImageConstant.tireservices,
                            height: figmaSpaceToPercentageHeight(150, context),
                            width: figmaSpaceToPercentageWidth(159, context),
                          ),
                        ),
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(26, context),
                        ),
                        Text(
                          "Tire\nServices",
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: figmaSpaceToPercentageHeight(23, context),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.5, // Set line height multiplier
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentageHeight(40, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(55, context),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.workhopBottomTab,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(96, 189, 52, 1),
                          // Change the button's background color
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            // Adjust the radius as needed
                          ),
                          minimumSize: Size(
                            figmaSpaceToPercentageWidth(93, context),
                            figmaSpaceToPercentageHeight(40, context),
                          ), // Set the button's width and height
                        ),
                        child: const Text(
                          "Done",
                          textAlign: TextAlign.center,
                          // Align the text in the center
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ), // Change the font size of the button text
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                ImageConstant.wrenchtool,
                height: figmaSpaceToPercentageHeight(240, context),
                width: figmaSpaceToPercentageWidth(300, context),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
