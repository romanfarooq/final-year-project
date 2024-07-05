import 'package:flutter/material.dart';

import '../utils/figma_space_to_percentage.dart';
import '../widgets/repair_type_widget.dart';

class TireRepair extends StatelessWidget {
  const TireRepair({super.key});

  final String repairType = 'Tire';

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
                Flexible(
                  flex: 1,
                  child: Text(
                    '$repairType Service',
                    style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentageHeight(22, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none),
                  ),
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
                Flexible(
                  flex: 1,
                  child: Text(
                    "What are you looking for ?",
                    style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentageHeight(19, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none),
                  ),
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
                      text: "Tire Installation",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Tire Balancing",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Wheel Alignment",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Tire Repairs",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Tire Rotation",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Tire Inspection and Service",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Wheel Rim Inspection and Service",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Custom Tire and Wheel Packages",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Tire Replacement",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Tire Pressure Checks",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Tire Pressure Monitoring System(TPMS)",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Flat Tire Repair",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Tire Mounting",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Tire Inflation Services",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Nitrogen Inflation Services",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Tire Sales (New and Used)",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Performance Tire Upgrades",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Seasonal Tire Swapping",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Tire Tread Depth Measurement",
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
