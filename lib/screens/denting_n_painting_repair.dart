import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../utils/figma_space_to_percentage.dart';
import '../widgets/repair_type_widget.dart';

class DentingNpaintingRepair extends StatefulWidget {
  const DentingNpaintingRepair({super.key});

  @override
  State<DentingNpaintingRepair> createState() => _DentingNpaintingRepairState();
}

class _DentingNpaintingRepairState extends State<DentingNpaintingRepair> {
  final String repairType = 'Denting And Painting';
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
            Row(children: [
              SizedBox(
                width: figmaSpaceToPercentageWidth(30, context),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  '$repairType Service',
                  style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(22, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none),
                ),
              ),
            ]),
            SizedBox(
              height: figmaSpaceToPercentage(2, context),
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
                      fontSize: figmaSpaceToPercentage(19, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
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
                      text: "Dent Removal",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Paintwork",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Scratch Repairs",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Rust Repairs",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Color Matching",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Collision Repairs",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Custom Paint Jobs",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Surface Preparation",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Panel Replacement/Repair",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Vehicle Wrapping",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Paint Protection Film (PPF) Installation",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Ceramic Coating",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Custom Graphics",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Clear Coat Application",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Detailing",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Paint Polishing/Compound and Buffing",
                      repairType: repairType,
                    ),
                    RepairTypeWidget(
                      text: "Weather Damage Repairs",
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
