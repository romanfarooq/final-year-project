import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../models/bidding_info.dart';
import '../models/car_info.dart';
import '../routes/app_routes.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../utils/toast_message.dart';

const List<Map<String, String>> oilBrands = [
  {'oilBrand': 'Shell', 'oilType': 'Helix 5W-30'},
  {'oilBrand': 'Shell', 'oilType': 'Rotella T6 5W-40'},
  {'oilBrand': 'Castrol', 'oilType': 'Edge 5W-30'},
  {'oilBrand': 'Castrol', 'oilType': 'Magnatec 5W-30'},
  {'oilBrand': 'Mobil 1', 'oilType': '5W-30'},
  {'oilBrand': 'Valvoline', 'oilType': 'SynPower 5W-30'},
  {'oilBrand': 'Valvoline', 'oilType': 'MaxLife 5W-30'},
  {'oilBrand': 'Pennzoil', 'oilType': 'Platinum 5W-30'},
  {'oilBrand': 'Pennzoil', 'oilType': 'Ultra Platinum 5W-30'},
  {'oilBrand': 'Royal Purple', 'oilType': 'API-Licensed SAE 5W-30'},
  {'oilBrand': 'Royal Purple', 'oilType': 'HPS 5W-30'},
  {'oilBrand': 'Liqui Moly', 'oilType': 'Molygen New Generation 5W-30'},
  {'oilBrand': 'Liqui Moly', 'oilType': 'Leichtlauf High Tech 5W-40'},
  {'oilBrand': 'Total', 'oilType': 'Quartz 9000 5W-30'},
  {'oilBrand': 'Total', 'oilType': 'Quartz INEO MC3 5W-30'},
  {'oilBrand': 'Amsoil', 'oilType': 'Signature Series 5W-30'},
  {'oilBrand': 'Amsoil', 'oilType': 'XL 5W-30'},
  {'oilBrand': 'Kendall', 'oilType': 'GT-1 Max 5W-30'},
  {'oilBrand': 'Kendall', 'oilType': 'Full Synthetic 5W-30'},
  {'oilBrand': 'Motul', 'oilType': '8100 X-cess 5W-30'},
  {'oilBrand': 'Motul', 'oilType': 'Specific 5W-30'},
  {'oilBrand': 'Red Line', 'oilType': 'High Performance 5W-30'},
  {'oilBrand': 'Red Line', 'oilType': 'Euro Series 5W-30'},
  {'oilBrand': 'Lucas', 'oilType': 'Synthetic 5W-30'},
  {'oilBrand': 'Lucas', 'oilType': 'High Mileage 5W-30'},
  {'oilBrand': 'Quaker State', 'oilType': 'Ultimate Durability 5W-30'},
  {'oilBrand': 'Quaker State', 'oilType': 'Advanced Durability 5W-30'},
];

class OilChange extends StatefulWidget {
  const OilChange({super.key});

  @override
  State<OilChange> createState() => _OilChangeState();
}

class _OilChangeState extends State<OilChange> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double semicircleWidth = 502; // Width of the semicircle

    double left = (screenWidth - semicircleWidth) / 2;
    double bottomMargin = 420; // Adjust the bottom margin as needed

    final userCarInfo = context.read<UserCarsInfo>();

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
                height: figmaSpaceToPercentageHeight(39, context),
              ),
              Row(
                children: [
                  SizedBox(width: figmaSpaceToPercentageWidth(27, context)),
                  Container(
                    height: figmaSpaceToPercentageHeight(50, context),
                    width: figmaSpaceToPercentageWidth(55, context),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.black,
                          size: figmaSpaceToPercentageHeight(30, context),
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
                    height: figmaSpaceToPercentageHeight(81, context),
                    width: figmaSpaceToPercentageWidth(128, context),
                    child: Image.asset(
                      ImageConstant.oilchange,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: figmaSpaceToPercentageHeight(20, context)),
              Row(
                children: [
                  SizedBox(
                    width: figmaSpaceToPercentageWidth(45, context),
                  ),
                  Text(
                    'Oil Change',
                    style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentageHeight(20, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
              SizedBox(height: figmaSpaceToPercentageHeight(35, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userCarInfo.getSelectedCLastOilChangeDistance
                        .toInt()
                        .toString(),
                    style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentageHeight(70, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(width: figmaSpaceToPercentageWidth(1, context)),
                  Column(
                    children: [
                      SizedBox(
                        height: figmaSpaceToPercentageHeight(40, context),
                      ),
                      Text(
                        'Km',
                        style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: figmaSpaceToPercentageHeight(20, context),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: figmaSpaceToPercentageHeight(0.1, context)),
              Text(
                'Last Oil Change',
                style: TextStyle(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: figmaSpaceToPercentageHeight(24, context),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: figmaSpaceToPercentageHeight(80, context)),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: oilBrands.length,
                  itemBuilder: (context, index) {
                    _selectedIndex = index;
                    return OilBrandCard(
                      oilBrand: oilBrands[index]['oilBrand']!,
                      oilType: oilBrands[index]['oilType']!,
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'swipe to see more',
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentageHeight(18, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: figmaSpaceToPercentageHeight(20, context),
                  ),
                ],
              ),
              SizedBox(
                height: figmaSpaceToPercentageHeight(50, context),
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
                      fontSize: figmaSpaceToPercentageHeight(24, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(
                    width: figmaSpaceToPercentageWidth(140, context),
                  ),
                  Container(
                    height: figmaSpaceToPercentageHeight(60, context),
                    width: figmaSpaceToPercentageWidth(60, context),
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
                        onPressed: () async {
                          try {
                            final Location location = Location();
                            LocationData locationData =
                                await location.getLocation();
                            final LatLng currentLocation = LatLng(
                              locationData.latitude!,
                              locationData.longitude!,
                            );
                            if (context.mounted) {
                              final carUserInfo = context.read<UserCarsInfo>();
                              final biddingInfo = context.read<BiddingInfo>();
                              await biddingInfo.setBidding(
                                userCarInfo.getUid!,
                                userCarInfo.getSelectedName,
                                'Oil Change',
                                oilBrands[_selectedIndex]['oilBrand']!,
                                oilBrands[_selectedIndex]['oilType']!,
                                carUserInfo.getBookingDate ?? DateTime.now(),
                                currentLocation,
                              );
                            }
                          } catch (error) {
                            ToastMessage().toastmessage('Error: $error');
                          }
                          if (context.mounted) {
                            Navigator.of(context).pushNamed(
                              AppRoutes.biddingScreen,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: figmaSpaceToPercentageHeight(10, context),
              ),
              Row(
                children: [
                  SizedBox(
                    width: figmaSpaceToPercentageWidth(73, context),
                  ),
                  Container(
                    width: figmaSpaceToPercentageWidth(159, context),
                    height: figmaSpaceToPercentageHeight(150, context),
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
                        height: figmaSpaceToPercentageHeight(100, context),
                      ),
                      Container(
                        width: figmaSpaceToPercentageWidth(111, context),
                        height: figmaSpaceToPercentageHeight(105, context),
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
              fontSize: figmaSpaceToPercentageHeight(50, context),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(
            height: figmaSpaceToPercentageHeight(1, context),
          ),
          FittedBox(
            child: Text(
              oilType,
              style: TextStyle(
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontSize: figmaSpaceToPercentageHeight(44, context),
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
