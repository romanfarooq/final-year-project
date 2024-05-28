import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import '../widgets/service_history_widget.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import 'package:car_care/screens/repair_details.dart';
class RepairTypeWidget extends StatelessWidget {
  final String text;
  final String repairType;

  RepairTypeWidget({
    required this.text,
    required this.repairType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RepairDetails(
                    text: text,
                    repairType: repairType,
                  ),
                ),
              );
            },
            child: Container(
              height: figmaSpaceToPercentage(46, context),
              width: figmaSpaceToPercentageWidth(378, context),
              decoration: BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.all(Radius.circular(71)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: figmaSpaceToPercentageWidth(23, context),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      text,
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(17, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  // Add other elements here based on repairType if needed
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: figmaSpaceToPercentage(10, context)), // Space after each container
      ],
    );
  }


}