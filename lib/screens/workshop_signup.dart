import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';

import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../models/workshop_info.dart';
import '../routes/app_routes.dart';

class WorkshopSignup extends StatefulWidget {
  const WorkshopSignup({super.key});

  @override
  State<WorkshopSignup> createState() => _WorkshopSignupState();
}

class _WorkshopSignupState extends State<WorkshopSignup> {
  final TextEditingController _workshopnameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _openinghoursController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _workshopnameController.dispose();
    _locationController.dispose();
    _contactController.dispose();
    _websiteController.dispose();
    _openinghoursController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: figmaSpaceToPercentage(55, context),
                  ),
                  Center(
                    child: Image.asset(
                      ImageConstant.carcare1,
                      height: 29,
                      width: 106,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(64, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(30, context),
                      ),
                      Text(
                        "Workshop Name:",
                        style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: figmaSpaceToPercentage(14, context),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(5, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(20, context),
                      ),
                      Container(
                        width: figmaSpaceToPercentageWidth(352, context),
                        height: figmaSpaceToPercentage(40, context),
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                figmaSpaceToPercentageWidth(26, context)),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(66, 84, 164, 0.49),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: TextField(
                          controller: _workshopnameController,
                          decoration: InputDecoration(
                            hintText: "Abc Auto Care",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(50, 50, 50, 0.6),
                              fontSize: figmaSpaceToPercentage(14, context),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: figmaSpaceToPercentage(
                                    16, context)), // Adjust vertical padding
                          ),
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: figmaSpaceToPercentage(14, context),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          textAlignVertical: TextAlignVertical
                              .center, // Center text vertically within the TextField
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(12, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(30, context),
                      ),
                      Text(
                        "Location:",
                        style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: figmaSpaceToPercentage(14, context),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(4, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(20, context),
                      ),
                      Container(
                        width: figmaSpaceToPercentageWidth(352, context),
                        height: figmaSpaceToPercentage(40, context),
                        padding: EdgeInsets.only(
                          left: figmaSpaceToPercentageWidth(26, context),
                          top: figmaSpaceToPercentage(10, context),
                        ),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(66, 84, 164, 0.49),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: TextField(
                          controller: _locationController,
                          decoration: InputDecoration(
                            hintText: "123 Main Street, City",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(50, 50, 50, 0.6),
                              fontSize: figmaSpaceToPercentage(14, context),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: figmaSpaceToPercentage(16, context)),
                          ),
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: figmaSpaceToPercentage(14, context),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(12, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(30, context),
                      ),
                      Text(
                        "Contact Information:",
                        style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: figmaSpaceToPercentage(14, context),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(4, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(20, context),
                      ),
                      Container(
                        width: figmaSpaceToPercentageWidth(352, context),
                        height: figmaSpaceToPercentage(40, context),
                        padding: EdgeInsets.only(
                          left: figmaSpaceToPercentage(26, context),
                          top: figmaSpaceToPercentage(10, context),
                        ),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(66, 84, 164, 0.49),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: TextField(
                          controller: _contactController,
                          decoration: InputDecoration(
                            hintText: "(+92) 123-6957495",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(50, 50, 50, 0.6),
                              fontSize: figmaSpaceToPercentage(14, context),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: figmaSpaceToPercentage(16, context)),
                          ),
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: figmaSpaceToPercentage(14, context),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(12, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(30, context),
                      ),
                      Text(
                        "Website: (optional)",
                        style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: figmaSpaceToPercentage(14, context),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(4, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(20, context),
                      ),
                      Container(
                        width: figmaSpaceToPercentageWidth(352, context),
                        height: figmaSpaceToPercentage(40, context),
                        padding: EdgeInsets.only(
                          left: figmaSpaceToPercentage(26, context),
                          top: figmaSpaceToPercentage(10, context),
                        ),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(66, 84, 164, 0.49),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: TextField(
                          controller: _websiteController,
                          decoration: InputDecoration(
                            hintText: "www.carecarepro.com",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(50, 50, 50, 0.6),
                              fontSize: figmaSpaceToPercentage(14, context),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: figmaSpaceToPercentage(16, context)),
                          ),
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: figmaSpaceToPercentage(14, context),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(12, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(30, context),
                      ),
                      Text(
                        "Opening Hours:",
                        style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: figmaSpaceToPercentage(14, context),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(4, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(20, context),
                      ),
                      Container(
                        width: figmaSpaceToPercentageWidth(150, context),
                        height: figmaSpaceToPercentage(40, context),
                        padding: EdgeInsets.only(
                          left: figmaSpaceToPercentage(26, context),
                          top: figmaSpaceToPercentage(10, context),
                        ),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(66, 84, 164, 0.49),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: TextField(
                          controller: _openinghoursController,
                          decoration: InputDecoration(
                            hintText: "10 am - 10 pm",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(50, 50, 50, 0.6),
                              fontSize: figmaSpaceToPercentage(14, context),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: figmaSpaceToPercentage(16, context)),
                          ),
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: figmaSpaceToPercentage(14, context),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(12, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(30, context),
                      ),
                      Text(
                        "Additional Notes: (optional)",
                        style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: figmaSpaceToPercentage(14, context),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(10, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(20, context),
                      ),
                      Container(
                        width: figmaSpaceToPercentageWidth(350, context),
                        height: 150,
                        padding: const EdgeInsets.only(left: 1),
                        margin: const EdgeInsets.only(left: 1),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(236, 236, 236, 0.77),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              inset: true,
                              offset: const Offset(1, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _descriptionController,
                          maxLines: null, // Allow multiple lines of text
                          keyboardType: TextInputType.multiline,
                          // Allow multiline input
                          decoration: InputDecoration(
                            hintText: "Enter your description here",
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(50, 50, 50, 0.6),
                              fontSize: figmaSpaceToPercentage(14, context),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: const EdgeInsets.all(15),
                            // Add padding to the hint text
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: figmaSpaceToPercentage(14, context),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentage(70, context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(20, context),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await context.read<WorkshopInfo>().updateWorkshopInfo(
                                workshopName:
                                    _workshopnameController.text.trim(),
                                location: _locationController.text.trim(),
                                contact: _contactController.text.trim(),
                                website: _websiteController.text.trim(),
                                openingHours:
                                    _openinghoursController.text.trim(),
                                description: _descriptionController.text.trim(),
                              );
                          Navigator.of(context).pushReplacementNamed(
                            AppRoutes.workshopServices,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(96, 189, 52, 1),
                          // Change the button's background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            // Adjust the radius as needed
                          ),
                          minimumSize: Size(
                            figmaSpaceToPercentageWidth(93, context),
                            figmaSpaceToPercentage(40, context),
                          ), // Set the button's width and height
                        ),
                        child: const Text(
                          "Next",
                          textAlign: TextAlign.center,
                          // Align the text in the center
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ), // Change the font size of the button text
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  ImageConstant.wrenchtool,
                  height: figmaSpaceToPercentage(240, context),
                  width: figmaSpaceToPercentageWidth(240, context),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
