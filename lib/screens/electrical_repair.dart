import 'package:flutter/material.dart';

import '../utils/figma_space_to_percentage.dart';
import '../widgets/repair_type_widget.dart';

class ElectricalRepair extends StatelessWidget {
  const ElectricalRepair({super.key});

  final String repairType = 'Electrical';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: figmaSpaceToPercentageHeight(39, context),
            ),
            Row(
              children: [
                SizedBox(width: figmaSpaceToPercentageWidth(27, context)),
                Container(
                  height: figmaSpaceToPercentageHeight(50, context),
                  width: figmaSpaceToPercentageWidth(50, context),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
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
              ],
            ),
            SizedBox(
              height: figmaSpaceToPercentageHeight(30, context),
            ),
            Row(
              children: [
                SizedBox(
                  width: figmaSpaceToPercentageWidth(30, context),
                ),
                Text(
                  '$repairType Service',
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
              height: figmaSpaceToPercentageHeight(2, context),
            ),
            Row(
              children: [
                SizedBox(
                  width: figmaSpaceToPercentageWidth(30, context),
                ),
                Text(
                  "What are you looking for ?",
                  style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentageHeight(19, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none),
                ),
              ],
            ),
            SizedBox(
              height: figmaSpaceToPercentageHeight(8, context),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: figmaSpaceToPercentageHeight(10, context),
                    ),
                    RepairTypeWidget(
                      text: "Lights",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "AC",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Multimedia",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Battery",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Starter Motor",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Alternator",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Ignition System",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Power Windows and Locks",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Power Seats",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Electrical Wiring",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Sensors",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "ECU Diagnostics",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Fuse Box and Fuses",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Lighting Control Module",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Instrument Cluster",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Horn",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Power Steering",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Central Locking System",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Cruise Control",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Security and Alarm Systems",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Communication Systems",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Heated Seats and Mirrors",
                      repairType: repairType,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
