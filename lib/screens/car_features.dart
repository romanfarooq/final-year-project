import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/car_info.dart';
import '../routes/app_routes.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_textwithcheckbox.dart';

class CarFeatures extends StatefulWidget {
  const CarFeatures({super.key});

  @override
  State<CarFeatures> createState() => _CarFeaturesState();
}

class _CarFeaturesState extends State<CarFeatures> {
  final Map<String, bool> _carFeatures = {
    "ABS": false,
    "AM/FM Radio": false,
    "Air Bags": false,
    "Air Conditioning": false,
    "Alloy Rims": false,
    "CD Player": false,
    "Cruise Control": false,
    "DVD Player": false,
    "Immobilizer Key": false,
    "Keyless Entry": false,
    "Navigation System": false,
    "Power Locks": false,
    "Power Mirrors": false,
    "Power Steering": false,
    "Power Windows": false,
    "Rear AC Vents": false,
    "Rear Speakers": false,
    "Sun Roof": false,
  };

  @override
  Widget build(BuildContext context) {
    final carInfo = context.read<UserCarsInfo>();
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    final String manufacture = args['manufacturer'];
    final String model = args['model'];
    final int year = args['year'];
    final Color color = args['color'];
    final String licensePlate = args['licensePlate'];
    final String vin = args['vin'];
    final double mileage = args['mileage'];
    final String fuelType = args['fuelType'];

    // Temporary values
    const double distanceTravelled = 1000;
    const double cc = 1.5;
    const String imgPath = 'assets/images/carlogo/Honda_CR-V.jpg';
    DateTime lastOilChange = DateTime.utc(2024, 05, 25);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            height: figmaSpaceToPercentage(80, context),
          ),
          Row(children: [
            SizedBox(
              width: figmaSpaceToPercentageWidth(32, context),
            ),
            Text(
              'Car Features',
              style: TextStyle(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: figmaSpaceToPercentage(22, context),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none),
            ),
          ]),
          SizedBox(
            height: figmaSpaceToPercentage(15, context),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _carFeatures.keys
                    .map((feature) => TextWithCheckbox(
                          text: feature,
                          isChecked: _carFeatures[feature]!,
                          onChanged: (newValue) {
                            setState(() {
                              _carFeatures[feature] = newValue;
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
          SizedBox(
            height: figmaSpaceToPercentage(44, context),
          ),
          Row(
            children: [
              SizedBox(width: figmaSpaceToPercentageWidth(40, context)),
              ElevatedButton(
                onPressed: () {
                  carInfo.addCar(
                    CarInfo(
                      manufacture: manufacture,
                      model: model,
                      licensePlate: licensePlate,
                      fuelType: fuelType,
                      color: color,
                      cc: cc,
                      year: year,
                      mileage: mileage,
                      distanceTravelled: distanceTravelled,
                      vin: vin,
                      lastOilChange: lastOilChange,
                      imgPath: imgPath,
                    ),
                  );
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.carUserMain,
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(96, 189, 52, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minimumSize: Size(
                    figmaSpaceToPercentageWidth(93, context),
                    figmaSpaceToPercentage(40, context),
                  ), // Set the button's width and height
                ),
                child: const Text(
                  "Skip",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ), // Change the font size of the button text
                ),
              ),
              SizedBox(width: figmaSpaceToPercentageWidth(20, context)),
              ElevatedButton(
                onPressed: () {
                  carInfo.addCar(
                    CarInfo(
                      manufacture: manufacture,
                      model: model,
                      licensePlate: licensePlate,
                      fuelType: fuelType,
                      color: color,
                      cc: cc,
                      year: year,
                      mileage: mileage,
                      distanceTravelled: distanceTravelled,
                      vin: vin,
                      lastOilChange: lastOilChange,
                      imgPath: imgPath,
                      carFeatures: _carFeatures,
                    ),
                  );
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.carUserMain,
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(96, 189, 52, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minimumSize: Size(
                    figmaSpaceToPercentageWidth(93, context),
                    figmaSpaceToPercentage(40, context),
                  ), // Set the button's width and height
                ),
                child: const Text(
                  "Done",
                  textAlign: TextAlign.center,
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
    );
  }
}
