import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import '../widgets/service_history_widget.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../widgets/repair_type_widget.dart';



class TireRepair extends StatefulWidget {
  const TireRepair({super.key});

  @override
  State<TireRepair> createState() => _TireRepairState();
}

class _TireRepairState extends State<TireRepair> {

  final String repairType = 'Tire';
  @override

  Widget build(BuildContext context) {
    return Column(
        children: [

          SizedBox(

            height: figmaSpaceToPercentage(39, context),
          ),
          Row(
            children: [
              SizedBox(
                  width: figmaSpaceToPercentageWidth(27, context)
              ),

              Container(
                height: figmaSpaceToPercentageWidth(50, context),
                width: figmaSpaceToPercentage(50, context),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.all(Radius.circular(50 / 2)),
                ),
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black,size: 30,),
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
              children:[
                SizedBox(
                  width: figmaSpaceToPercentageWidth(30, context),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    '${repairType} Service',
                    style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(22, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none),
                  ),
                ),
              ]
          ),

          SizedBox(
            height: figmaSpaceToPercentage(2, context),
          ),

          Row(
              children:[
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
                        decoration: TextDecoration.none),
                  ),
                ),


              ]
          ),

          SizedBox(
            height: figmaSpaceToPercentage(8, context),
          ),

          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: figmaSpaceToPercentage(10, context),
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
                ),RepairTypeWidget(
                  text: "Wheel Rim Inspection and Service",
                  repairType: repairType,
                ),RepairTypeWidget(
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





        ]
    );
  }
}
