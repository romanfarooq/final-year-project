import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_textwithcheckbox.dart';

class TireServiceVault extends StatefulWidget {
  const TireServiceVault({super.key});

  @override
  State<TireServiceVault> createState() => _TireServiceVaultState();
}

class _TireServiceVaultState extends State<TireServiceVault> {
  @override
  Widget build(BuildContext context) {
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
              'Tire Services',
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
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextWithCheckbox(text: 'Tire Installation'),
                  TextWithCheckbox(text: 'Tire Balancing'),
                  TextWithCheckbox(text: 'Wheel Alignment'),
                  TextWithCheckbox(text: 'Tire Repairs'),
                  TextWithCheckbox(text: 'Tire Rotation'),
                  TextWithCheckbox(text: 'Tire Inspection and Service'),
                  TextWithCheckbox(text: 'Wheel Rim Inspection and Service'),
                  TextWithCheckbox(text: 'Custom Tire and Wheel Packages'),
                  TextWithCheckbox(text: 'Tire Replacement'),
                  TextWithCheckbox(text: 'Tire Pressure Checks'),
                  TextWithCheckbox(
                      text: 'Tire Pressure Monitoring System(TPMS)'),
                  TextWithCheckbox(text: 'Flat Tire Repair'),
                  TextWithCheckbox(text: 'Tire Mounting'),
                  TextWithCheckbox(text: 'Tire Inflation Services'),
                  TextWithCheckbox(text: 'Nitrogen Inflation Services'),
                  TextWithCheckbox(text: 'Tire Sales (New and Used)'),
                  TextWithCheckbox(text: 'Performance Tire Upgrades'),
                  TextWithCheckbox(text: 'Seasonal Tire Swapping'),
                  TextWithCheckbox(text: 'Tire Tread Depth Measurement'),
                ],
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
                  // Add your onPressed logic here
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
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: figmaSpaceToPercentageWidth(159, context),
              height: figmaSpaceToPercentage(150, context),
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
                height: figmaSpaceToPercentage(150, context),
                width: figmaSpaceToPercentageWidth(159, context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
