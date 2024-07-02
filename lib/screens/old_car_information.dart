import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../models/car_info.dart';
import '../models/car_data.dart';

class OldCarInformation extends StatefulWidget {
  const OldCarInformation({super.key});

  @override
  State<OldCarInformation> createState() => _CarUserSignupState();
}

class _CarUserSignupState extends State<OldCarInformation> {
  final _distanceTravelledController = TextEditingController();
  final _lastOilChangeDistanceController = TextEditingController();

  @override
  void dispose() {
    _distanceTravelledController.dispose();
    _lastOilChangeDistanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final carInfo = context.read<UserCarsInfo>();
    final licensePlate = ModalRoute.of(context)!.settings.arguments as String;
    final manufacturer = carInfo.getManufacturerByLicensePlate(licensePlate);
    final logo = carManufacturersLogo[manufacturer]!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            // color: Colors.black,
            padding: EdgeInsets.symmetric(
              horizontal: figmaSpaceToPercentageWidth(35, context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
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
                Padding(
                  padding: EdgeInsets.only(
                    left: figmaSpaceToPercentageWidth(15, context),
                  ),
                  child: Text(
                    "Distance Travelled:",
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(20, context),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(5, context),
                ),
                Container(
                  width: figmaSpaceToPercentageWidth(352, context),
                  height: figmaSpaceToPercentage(65, context),
                  padding: EdgeInsets.only(
                    left: figmaSpaceToPercentageWidth(26, context),
                    top: figmaSpaceToPercentage(2, context),
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(66, 84, 164, 0.49),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: TextField(
                    controller: _distanceTravelledController,
                    decoration: InputDecoration(
                      hintText: "13464 km",
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(50, 50, 50, 0.6),
                        fontSize: figmaSpaceToPercentage(20, context),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(20, context),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(15, context),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: figmaSpaceToPercentageWidth(15, context),
                  ),
                  child: Text(
                    "Last Oil Change Distance:",
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(20, context),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(5, context),
                ),
                Container(
                  width: figmaSpaceToPercentageWidth(352, context),
                  height: figmaSpaceToPercentage(65, context),
                  padding: EdgeInsets.only(
                    left: figmaSpaceToPercentageWidth(26, context),
                    top: figmaSpaceToPercentage(2, context),
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(66, 84, 164, 0.49),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: TextField(
                    controller: _lastOilChangeDistanceController,
                    decoration: InputDecoration(
                      hintText: "145 km",
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(50, 50, 50, 0.6),
                        fontSize: figmaSpaceToPercentage(20, context),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(20, context),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(20, context),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_distanceTravelledController.text.isEmpty ||
                        _lastOilChangeDistanceController.text.isEmpty) {
                      return;
                    }
                    await carInfo.updateCarDistanceAndOilChange(
                      licensePlate,
                      double.parse(
                        _distanceTravelledController.text.trim(),
                      ),
                      double.parse(
                        _lastOilChangeDistanceController.text.trim(),
                      ),
                    );
                    if (context.mounted) {
                      Navigator.of(context).pushNamed(
                        AppRoutes.carFeatures,
                        arguments: licensePlate,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(96, 189, 52, 1),
                    padding: EdgeInsets.symmetric(
                      vertical: figmaSpaceToPercentage(10, context),
                      horizontal: figmaSpaceToPercentageWidth(30, context),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: Size(
                      figmaSpaceToPercentageWidth(93, context),
                      figmaSpaceToPercentage(40, context),
                    ),
                  ),
                  child: const Text(
                    "Next",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(10, context),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: figmaSpaceToPercentage(20, context),
                      ),
                      child: Image.asset(
                        logo,
                        height: figmaSpaceToPercentage(170, context),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
