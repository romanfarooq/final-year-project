import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../utils/figma_space_to_percentage.dart';
import '../widgets/repair_type_widget.dart';

class MechanicalRepair extends StatefulWidget {
  const MechanicalRepair({super.key});

  @override
  State<MechanicalRepair> createState() => _MechanicalRepairState();
}

class _MechanicalRepairState extends State<MechanicalRepair> {
  final String repairType = 'Mechanical';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
              ],
            ),
            SizedBox(
              height: figmaSpaceToPercentage(30, context),
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
                      fontSize: figmaSpaceToPercentage(22, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none),
                ),
              ],
            ),
            SizedBox(
              height: figmaSpaceToPercentage(2, context),
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
                      fontSize: figmaSpaceToPercentage(19, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none),
                ),
              ],
            ),
            SizedBox(
              height: figmaSpaceToPercentage(8, context),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: figmaSpaceToPercentage(10, context),
                    ),
                    RepairTypeWidget(
                      text: "Engine Oil",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Engine Repairs",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Brakes",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Transmission Services",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Exhaust Systems",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Suspension System",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Steering System",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Clutch System",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Fuel System",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Cooling System",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Timing Belt/Chain Replacement",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Drive Belts and Chains",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Engine Overhaul",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Fuel Injection System",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Air Intake System",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Throttle Body",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Engine Mounts",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Gaskets and Seals",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Powertrain Services",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Differential Services",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "CV Joints and Boots",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Axle and Drivetrain Services",
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
