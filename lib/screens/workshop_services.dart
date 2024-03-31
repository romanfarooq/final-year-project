import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';


class Workshopservices extends StatefulWidget {
  const Workshopservices({super.key});

  @override
  State<Workshopservices> createState() => _WorkshopservicesState();
}

class _WorkshopservicesState extends State<Workshopservices> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: figmaSpaceToPercentage(55, context),
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
                    height: figmaSpaceToPercentage(50, context),
                  ),
                  InkWell(
                    onTap: () {
                      // print('hi');
                    },
                    child: Row(
                      children:[

                        SizedBox(
                          width: figmaSpaceToPercentageWidth(40, context),
                        ),

                        Container(
                        width: figmaSpaceToPercentageWidth(159, context),
                        height: figmaSpaceToPercentage(150, context),
                        padding: const EdgeInsets.only(left: 1),
                        margin: const EdgeInsets.only(left: 1),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(236, 236, 236, 0.77),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
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
                            child:Image.asset(
                                ImageConstant.electricalrepairs,
                                height: figmaSpaceToPercentage(150, context),
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
                            fontSize: figmaSpaceToPercentage(23, context),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.5, // Set line height multiplier
                          ),
                        ),
                        ]
                    ),
                  ),
                  
                  SizedBox(
                    height: figmaSpaceToPercentage(25, context),
                  ),

                  InkWell(
                    onTap: () {
                      // print('hi');
                    },
                    child: Row(
                        children:[

                          SizedBox(
                            width: figmaSpaceToPercentageWidth(40, context),
                          ),

                          Container(
                            width: figmaSpaceToPercentageWidth(159, context),
                            height: figmaSpaceToPercentage(150, context),
                            padding: const EdgeInsets.only(left: 1),
                            margin: const EdgeInsets.only(left: 1),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(236, 236, 236, 0.77),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
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
                            child:Image.asset(
                              ImageConstant.mechanical,
                              height: figmaSpaceToPercentage(150, context),
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
                              fontSize: figmaSpaceToPercentage(23, context),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1.5, // Set line height multiplier
                            ),
                          ),
                        ]
                    ),
                  ),

                  SizedBox(
                    height: figmaSpaceToPercentage(25, context),
                  ),

                  InkWell(
                    onTap: () {
                      // print('hi');
                    },
                    child: Row(
                        children:[

                          SizedBox(
                            width: figmaSpaceToPercentageWidth(40, context),
                          ),

                          Container(
                            width: figmaSpaceToPercentageWidth(159, context),
                            height: figmaSpaceToPercentage(150, context),
                            padding: const EdgeInsets.only(left: 1),
                            margin: const EdgeInsets.only(left: 1),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(236, 236, 236, 0.77),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
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
                            child:Image.asset(
                              ImageConstant.dentingNpainting,
                              height: figmaSpaceToPercentage(150, context),
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
                              fontSize: figmaSpaceToPercentage(23, context),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1.5, // Set line height multiplier
                            ),
                          ),
                        ]
                    ),
                  ),


                  SizedBox(
                    height: figmaSpaceToPercentage(25, context),
                  ),

                  InkWell(
                    onTap: () {
                      // print('hi');
                    },
                    child: Row(
                        children:[

                          SizedBox(
                            width: figmaSpaceToPercentageWidth(40, context),
                          ),

                          Container(
                            width: figmaSpaceToPercentageWidth(159, context),
                            height: figmaSpaceToPercentage(150, context),
                            padding: const EdgeInsets.only(left: 1),
                            margin: const EdgeInsets.only(left: 1),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(236, 236, 236, 0.77),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
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
                            child:Image.asset(
                              ImageConstant.tireservices,
                              height: figmaSpaceToPercentage(150, context),
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
                              fontSize: figmaSpaceToPercentage(23, context),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1.5, // Set line height multiplier
                            ),
                          ),

                        ]
                    ),
                  ), 
                  SizedBox(
                    height: figmaSpaceToPercentage(40, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(55, context),
                      ),
                      ElevatedButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(96, 189, 52, 1),
                        // Change the button's background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          // Adjust the radius as needed
                        ),
                        minimumSize: Size(
                          figmaSpaceToPercentageWidth(93, context),
                          figmaSpaceToPercentage(40, context),
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
    ]
                  ),

                ],
              )),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            ImageConstant.wrenchtool,
            height: figmaSpaceToPercentage(240, context),
            width: figmaSpaceToPercentageWidth(300, context),
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
