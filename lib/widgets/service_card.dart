import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../screens/service_card_detail.dart';
import '../utils/figma_space_to_percentage.dart';

class ServiceRecordWidget extends StatelessWidget {
  final String text;
  final String categoryName; // New parameter for the category name

  const ServiceRecordWidget({
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
                child: Container(
                  width: double.infinity,
                  height: figmaSpaceToPercentageHeight(49, context),
                  padding: const EdgeInsets.only(left: 1),
                  margin: const EdgeInsets.only(left: 1),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 1),
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
                              left: figmaSpaceToPercentageWidth(21, context)),
                          child: Text(
                            text,
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize:
                                  figmaSpaceToPercentageHeight(17, context),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 1.5,
                        right: 20, // Positioned 20 pixels from the right side
                        child: IconButton(
                          icon: const Icon(
                            Icons.info_outline_rounded,
                            size: 30,
                          ), // Change the icon as needed
                          onPressed: () {
                            // Navigate to the ServiceCardDetail page with parameters
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ServiceCardDetail(
                                  text: text,
                                  categoryName: categoryName,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: figmaSpaceToPercentageHeight(
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
