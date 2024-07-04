import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';

class OilChange extends StatelessWidget {
  const OilChange({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double semicircleWidth = 502; // Width of the semicircle

    double left = (screenWidth - semicircleWidth) / 2;
    double bottomMargin = 420; // Adjust the bottom margin as needed

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: left,
            bottom: bottomMargin,
            child: Transform.rotate(
              angle: pi, // Rotate by pi radians (180 degrees)
              child: CustomPaint(
                size: const Size(502, 251),
                painter: BottomOvalBorderPainter(),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: figmaSpaceToPercentage(39, context),
              ),
              Row(
                children: [
                  SizedBox(width: figmaSpaceToPercentageWidth(27, context)),
                  Container(
                    height: figmaSpaceToPercentageWidth(50, context),
                    width: figmaSpaceToPercentage(50, context),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.all(Radius.circular(50 / 2)),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          //Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: figmaSpaceToPercentageWidth(200, context),
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(81, context),
                    width: figmaSpaceToPercentageWidth(128, context),
                    child: Image.asset(
                      ImageConstant.oilchange,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: figmaSpaceToPercentage(20, context)),
              Row(
                children: [
                  SizedBox(
                    width: figmaSpaceToPercentageWidth(45, context),
                  ),
                  Text(
                    'Oil Change',
                    style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(20, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
              SizedBox(height: figmaSpaceToPercentage(35, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '24513',
                    style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(70, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(width: figmaSpaceToPercentageWidth(1, context)),
                  Column(
                    children: [
                      SizedBox(
                        height: figmaSpaceToPercentage(40, context),
                      ),
                      Text(
                        'Km',
                        style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: figmaSpaceToPercentage(20, context),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: figmaSpaceToPercentage(0.1, context)),
              Text(
                'Last Oil Change',
                style: TextStyle(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: figmaSpaceToPercentage(24, context),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: figmaSpaceToPercentage(80, context)),
              Column(
                children: [
                  Material(
                    child: Flexible(
                      flex: 1,
                      child: Text(
                        'Shell',
                        style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: figmaSpaceToPercentage(51, context),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(1, context),
                  ),
                  Text(
                    '5W-30',
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(44, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      height: 0.5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: figmaSpaceToPercentage(70, context),
              ),
              Row(
                children: [
                  SizedBox(
                    width: figmaSpaceToPercentageWidth(30, context),
                  ),
                  Text(
                    "Start Looking..",
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(24, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(
                    width: figmaSpaceToPercentageWidth(140, context),
                  ),
                  Container(
                    height: figmaSpaceToPercentageWidth(60, context),
                    width: figmaSpaceToPercentage(60, context),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.all(Radius.circular(60 / 2)),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.search_sharp,
                            color: Colors.black, size: 35),
                        onPressed: () {
                          //Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: figmaSpaceToPercentage(10, context),
              ),
              Row(
                children: [
                  SizedBox(
                    width: figmaSpaceToPercentageWidth(73, context),
                  ),
                  Container(
                    width: figmaSpaceToPercentageWidth(159, context),
                    height: figmaSpaceToPercentage(150, context),
                    padding: const EdgeInsets.only(left: 1),
                    margin: const EdgeInsets.only(left: 1),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 254, 0.9),
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                    child: Center(
                      child: Image.asset(
                        ImageConstant.oilchange,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: figmaSpaceToPercentageWidth(15, context),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: figmaSpaceToPercentage(100, context),
                      ),
                      Container(
                        width: figmaSpaceToPercentageWidth(111, context),
                        height: figmaSpaceToPercentage(105, context),
                        padding: const EdgeInsets.only(left: 1),
                        margin: const EdgeInsets.only(left: 1),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.9),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
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
                        child: Center(
                          child: Image.asset(
                            ImageConstant.oilchange,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BottomOvalBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke;

    final double controlPointX = (size.width / 2);
    final double controlPointY =
        (size.height * 0.3) - 80; // Adjust this value to control the curvature

    final Path path = Path();

    // Start at the bottom left corner
    path.moveTo(0, size.height);

    // Draw a segment of the lower circle using a quadratic bezier curve
    path.quadraticBezierTo(
        controlPointX,
        controlPointY, // Control point
        size.width,
        size.height); // End point

    // Draw the path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
