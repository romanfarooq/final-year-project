import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_gradientdecent.dart';

class CustomProfileWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String id;

  const CustomProfileWidget({
    required this.imageUrl,
    required this.name,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          child: InkWell(
            onTap: () {
              print('hi');
            },
            child: Row(
              children: [
                SizedBox(
                  width: figmaSpaceToPercentageWidth(15, context),
                ),
                Container(
                  width: figmaSpaceToPercentageWidth(76.09, context),
                  height: figmaSpaceToPercentage(76.09, context),
                  child: GradientBorder(
                    colors: [
                      Color.fromRGBO(250, 240, 6, 1),
                      Color.fromRGBO(250, 204, 5, 0.94),
                      Color.fromRGBO(255, 0, 0, 0.59),
                      Color.fromRGBO(54, 0, 124, 0.3),
                    ],
                    child: Padding(
                      padding: EdgeInsets.all(7.0),
                      child: ClipOval(
                        child: Image.asset(
                          imageUrl,
                          height: figmaSpaceToPercentage(70, context),
                          width: figmaSpaceToPercentageWidth(70, context),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: figmaSpaceToPercentageWidth(15, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(14, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(
                      height: figmaSpaceToPercentage(2, context),
                    ),
                    Text(
                      id,
                      style: TextStyle(
                        color: const Color.fromRGBO(125, 125, 125, 1),
                        fontSize: figmaSpaceToPercentage(14, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

        SizedBox(
          height: figmaSpaceToPercentage(12, context), // Height of the SizedBox
        ),
      ],
    );
  }
}
