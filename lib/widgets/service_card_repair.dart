import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../screens/service_card_dtail_repair.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';

class ServiceRecordWidgetRepair extends StatelessWidget {
  final String text;
  final String categoryName; // New parameter for the category name

  const ServiceRecordWidgetRepair({
    super.key,
    required this.text,
    required this.categoryName, // Make sure it's required
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: figmaSpaceToPercentageWidth(68, context),
        ),
        Expanded(
          child: Column(
            children: [
              Material(
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ServiceCardDetail(text: text, categoryName: categoryName),
                    //   ),
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    height: figmaSpaceToPercentage(49, context),
                    padding: const EdgeInsets.only(left: 1),
                    margin: const EdgeInsets.only(left: 1),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(96, 189, 52, 1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          inset: true,
                          offset: const Offset(-1, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: figmaSpaceToPercentage(21, context)),
                            child: Text(
                              text,
                              style: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: figmaSpaceToPercentage(17, context),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: figmaSpaceToPercentage(12, context),
                          right: figmaSpaceToPercentageWidth(20, context),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ServiceCardDetailRepair(
                                            text: text,
                                            categoryName: categoryName),
                                  ),
                                );
                              },
                              child: Container(
                                width: figmaSpaceToPercentageWidth(24, context),
                                height: figmaSpaceToPercentage(24, context),
                                decoration: BoxDecoration(
                                  color: Colors
                                      .transparent, // Background color of the circle
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white, // Color of the border
                                    width: 2, // Width of the border
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    ImageConstant.information,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Positioned 20 pixels from the right side
                          // child: IconButton(
                          //   icon: Icon(Icons.info_outline_rounded, size: 30,color: const Color.fromRGBO(0,0,0, 1),), // Change the icon as needed
                          //   onPressed: () {
                          //     // Navigate to the ServiceCardDetail page with parameters
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => ServiceCardDetail(text: text, categoryName: categoryName),
                          //       ),
                          //     );
                          //   },
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: figmaSpaceToPercentage(
                  20,
                  context,
                ), // Adjust the height as needed
              ),
            ],
          ),
        ),
      ],
    );
  }
}
