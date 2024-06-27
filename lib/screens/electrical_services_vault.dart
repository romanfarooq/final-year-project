import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_textwithcheckbox.dart';

class ElectricalServiceVault extends StatefulWidget {
  const ElectricalServiceVault({super.key});

  @override
  State<ElectricalServiceVault> createState() => _ElectricalServiceVaultState();
}

class _ElectricalServiceVaultState extends State<ElectricalServiceVault> {
  final Map<String, bool> _electricalServices = {
    "Lights": false,
    "AC": false,
    "Multimedia": false,
    "Battery": false,
    "Starter Motor": false,
    "Alternator": false,
    "Ignition System": false,
    "Power Windows and Locks": false,
    "Power Seats": false,
    "Electrical Wiring": false,
    "Sensors": false,
    "ECU Diagnostics": false,
    "Fuse Box and Fuses": false,
    "Lighting Control Module": false,
    "Instrument Cluster": false,
    "Horn": false,
    "Power Steering": false,
    "Central Locking System": false,
    "Cruise Control": false,
    "Security and Alarm Systems": false,
    "Communication Systems": false,
    "Heated Seats and Mirrors": false,
  };

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
          Row(
            children: [
              SizedBox(
                width: figmaSpaceToPercentageWidth(32, context),
              ),
              Text(
                'Electrical Repairs',
                style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: figmaSpaceToPercentage(22, context),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none),
              ),
            ],
          ),
          SizedBox(
            height: figmaSpaceToPercentage(15, context),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _electricalServices.keys
                    .map((service) => TextWithCheckbox(
                          text: service,
                          isChecked: _electricalServices[service]!,
                          onChanged: (newValue) {
                            setState(() {
                              _electricalServices[service] = newValue;
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
                ImageConstant.electricalrepairs,
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
