import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/car_info.dart';
import '../routes/app_routes.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_textwithcheckbox.dart';

class CarFeatures extends StatelessWidget {
  const CarFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    final carInfo = context.watch<UserCarsInfo>();
    final licensePlate = ModalRoute.of(context)!.settings.arguments as String;
    final features = carInfo.getCarFeaturesByLicensePlate(licensePlate);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: figmaSpaceToPercentageHeight(55, context),
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
            height: figmaSpaceToPercentageHeight(80, context),
          ),
          Row(
            children: [
              SizedBox(
                width: figmaSpaceToPercentageWidth(32, context),
              ),
              Text(
                'Car Features',
                style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: figmaSpaceToPercentageHeight(22, context),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none),
              ),
            ],
          ),
          SizedBox(
            height: figmaSpaceToPercentageHeight(15, context),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: features.keys
                    .map((feature) => TextWithCheckbox(
                          text: feature,
                          isChecked: features[feature]!,
                          onChanged: (newValue) {
                            features[feature] = newValue;
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
          SizedBox(
            height: figmaSpaceToPercentageHeight(44, context),
          ),
          Row(
            children: [
              SizedBox(width: figmaSpaceToPercentageWidth(40, context)),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.bottomTab,
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
                    figmaSpaceToPercentageHeight(40, context),
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
                onPressed: () async {
                  await carInfo.updateCarFeatures(licensePlate, features);
                  if (context.mounted) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.bottomTab,
                      (route) => false,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(96, 189, 52, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minimumSize: Size(
                    figmaSpaceToPercentageWidth(93, context),
                    figmaSpaceToPercentageHeight(40, context),
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
