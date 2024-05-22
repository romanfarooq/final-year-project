import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import 'package:car_care/widgets/custom_textwithcheckbox.dart';

class MechanicalServiceVault extends StatefulWidget {
  const MechanicalServiceVault({super.key});

  @override
  State<MechanicalServiceVault> createState() => _MechanicalServiceVaultState();
}

class _MechanicalServiceVaultState extends State<MechanicalServiceVault> {
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
              'Mechanical Repairs',
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
                children: [
                  TextWithCheckbox(text: 'Engine Oil'),
                  TextWithCheckbox(text: 'Engine Repairs'),
                  TextWithCheckbox(text: 'Brakes'),
                  TextWithCheckbox(text: 'Transmission Services'),
                  TextWithCheckbox(text: 'Exhaust System'),
                  TextWithCheckbox(text: 'Suspension System'),
                  TextWithCheckbox(text: 'Steering System'),
                  TextWithCheckbox(text: 'Clutch System'),
                  TextWithCheckbox(text: 'Fuel System'),
                  TextWithCheckbox(text: 'Cooling System'),
                  TextWithCheckbox(text: 'Timing Belt/Chain Replacement'),
                  TextWithCheckbox(text: 'Drive Belts and Chains'),
                  TextWithCheckbox(text: 'Engine Overhaul'),
                  TextWithCheckbox(text: 'Fuel Injection System'),
                  TextWithCheckbox(text: 'Air Intake System'),
                  TextWithCheckbox(text: 'Throttle Body'),
                  TextWithCheckbox(text: 'Engine Mounts'),
                  TextWithCheckbox(text: 'Gaskets and Seals'),
                  TextWithCheckbox(text: 'Powertrain Services'),
                  TextWithCheckbox(text: 'Differential Services'),
                  TextWithCheckbox(text: 'CV Joints and Boots'),
                  TextWithCheckbox(text: 'Axle and Drivetrain Services'),
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

              ]
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
                ImageConstant.mechanical,
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
