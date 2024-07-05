import 'package:flutter/material.dart';
import '../utils/figma_space_to_percentage.dart';
import '../widgets/custom_gradientdecent.dart';

class CustomProfileWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String id;

  const CustomProfileWidget({
    super.key,
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
              // print('hi');
            },
            child: Row(
              children: [
                SizedBox(
                  width: figmaSpaceToPercentageWidth(15, context),
                ),
                SizedBox(
                  width: figmaSpaceToPercentageWidth(76.09, context),
                  height: figmaSpaceToPercentageHeight(76.09, context),
                  child: GradientBorder(
                    colors: const [
                      Color.fromRGBO(250, 240, 6, 1),
                      Color.fromRGBO(250, 204, 5, 0.94),
                      Color.fromRGBO(255, 0, 0, 0.59),
                      Color.fromRGBO(54, 0, 124, 0.3),
                    ],
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: ClipOval(
                        child: Image.asset(
                          imageUrl,
                          height: figmaSpaceToPercentageHeight(70, context),
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
                        fontSize: figmaSpaceToPercentageHeight(14, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(
                      height: figmaSpaceToPercentageHeight(2, context),
                    ),
                    Text(
                      id,
                      style: TextStyle(
                        color: const Color.fromRGBO(125, 125, 125, 1),
                        fontSize: figmaSpaceToPercentageHeight(14, context),
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
          height: figmaSpaceToPercentageHeight(
              12, context), // Height of the SizedBox
        ),
      ],
    );
  }
}
