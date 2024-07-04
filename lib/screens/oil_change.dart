import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';

import '../models/car_info.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';

const oilBrands = [
  OilBrandCard(oilBrand: 'Castrol', oilType: 'Edge 5W-30'),
  OilBrandCard(oilBrand: 'Castrol', oilType: 'Magnatec 5W-30'),
  OilBrandCard(oilBrand: 'Mobil 1', oilType: '5W-30'),
  OilBrandCard(oilBrand: 'Shell', oilType: 'Helix 5W-30'),
  OilBrandCard(oilBrand: 'Shell', oilType: 'Rotella T6 5W-40'),
  OilBrandCard(oilBrand: 'Valvoline', oilType: 'SynPower 5W-30'),
  OilBrandCard(oilBrand: 'Valvoline', oilType: 'MaxLife 5W-30'),
  OilBrandCard(oilBrand: 'Pennzoil', oilType: 'Platinum 5W-30'),
  OilBrandCard(oilBrand: 'Pennzoil', oilType: 'Ultra Platinum 5W-30'),
  OilBrandCard(oilBrand: 'Royal Purple', oilType: 'API-Licensed SAE 5W-30'),
  OilBrandCard(oilBrand: 'Royal Purple', oilType: 'HPS 5W-30'),
  OilBrandCard(oilBrand: 'Liqui Moly', oilType: 'Molygen New Generation 5W-30'),
  OilBrandCard(oilBrand: 'Liqui Moly', oilType: 'Leichtlauf High Tech 5W-40'),
  OilBrandCard(oilBrand: 'Total', oilType: 'Quartz 9000 5W-30'),
  OilBrandCard(oilBrand: 'Total', oilType: 'Quartz INEO MC3 5W-30'),
  OilBrandCard(oilBrand: 'Amsoil', oilType: 'Signature Series 5W-30'),
  OilBrandCard(oilBrand: 'Amsoil', oilType: 'XL 5W-30'),
  OilBrandCard(oilBrand: 'Kendall', oilType: 'GT-1 Max 5W-30'),
  OilBrandCard(oilBrand: 'Kendall', oilType: 'Full Synthetic 5W-30'),
  OilBrandCard(oilBrand: 'Motul', oilType: '8100 X-cess 5W-30'),
  OilBrandCard(oilBrand: 'Motul', oilType: 'Specific 5W-30'),
  OilBrandCard(oilBrand: 'Red Line', oilType: 'High Performance 5W-30'),
  OilBrandCard(oilBrand: 'Red Line', oilType: 'Euro Series 5W-30'),
  OilBrandCard(oilBrand: 'Lucas', oilType: 'Synthetic 5W-30'),
  OilBrandCard(oilBrand: 'Lucas', oilType: 'High Mileage 5W-30'),
  OilBrandCard(oilBrand: 'Quaker State', oilType: 'Ultimate Durability 5W-30'),
  OilBrandCard(oilBrand: 'Quaker State', oilType: 'Advanced Durability 5W-30'),
];

class OilChange extends StatelessWidget {
  const OilChange({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double semicircleWidth = 502; // Width of the semicircle

    double left = (screenWidth - semicircleWidth) / 2;
    double bottomMargin = 420; // Adjust the bottom margin as needed

    final carInfo = context.read<UserCarsInfo>().getSelectedCar;

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
                    width: figmaSpaceToPercentage(55, context),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
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
                    carInfo.lastOilChangeDistance.toInt().toString(),
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
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: oilBrands.length,
                  itemBuilder: (context, index) {
                    return oilBrands[index];
                  },
                ),
              ),
              SizedBox(
                height: figmaSpaceToPercentage(50, context),
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
                        icon: const Icon(
                          Icons.search_sharp,
                          color: Colors.black,
                          size: 35,
                        ),
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
        (size.height * 0.3) - 300; // Adjust this value to control the curvature

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

class OilBrandCard extends StatelessWidget {
  final String oilBrand;
  final String oilType;

  const OilBrandCard({
    super.key,
    required this.oilBrand,
    required this.oilType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: figmaSpaceToPercentageWidth(30, context),
      ),
      child: Column(
        children: [
          Text(
            oilBrand,
            style: TextStyle(
              color: const Color.fromRGBO(0, 0, 0, 1),
              fontSize: figmaSpaceToPercentage(50, context),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(
            height: figmaSpaceToPercentage(1, context),
          ),
          FittedBox(
            child: Text(
              oilType,
              style: TextStyle(
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontSize: figmaSpaceToPercentage(44, context),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
                height: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
