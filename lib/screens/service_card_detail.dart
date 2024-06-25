import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';

class ServiceCardDetail extends StatefulWidget {
  final String text;
  final String categoryName;

  const ServiceCardDetail({
    super.key,
    required this.text,
    required this.categoryName,
  });

  @override
  State<ServiceCardDetail> createState() => _ServiceCardDetailState();
}

class _ServiceCardDetailState extends State<ServiceCardDetail> {
  final TextEditingController _descriptionController = TextEditingController();
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _descriptionController.text = widget.text; // Set initial text
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: figmaSpaceToPercentage(55, context),
          ),
          Row(
            children: [
              SizedBox(
                width: figmaSpaceToPercentageWidth(162, context),
              ),
              Image.asset(
                ImageConstant.carcare1,
                height: 29,
                width: 106,
                alignment: Alignment.center,
              ),
              SizedBox(
                width: figmaSpaceToPercentageWidth(86, context),
              ),
              Container(
                width: figmaSpaceToPercentageWidth(60, context),
                height: figmaSpaceToPercentage(40, context),
                padding: const EdgeInsets.only(left: 1),
                margin: const EdgeInsets.only(left: 1),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Image.asset(
                  ImageConstant.actions,
                  height: figmaSpaceToPercentage(20, context),
                  width: figmaSpaceToPercentageWidth(20, context),
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
          SizedBox(
            height: figmaSpaceToPercentage(55, context),
          ),
          Row(
            children: [
              SizedBox(
                width: figmaSpaceToPercentageWidth(33, context),
              ),
              Text(
                '${widget.categoryName} Service',
                style: TextStyle(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: figmaSpaceToPercentage(21, context),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          SizedBox(
            height: figmaSpaceToPercentage(24, context),
          ),
          Row(
            children: [
              SizedBox(
                width: figmaSpaceToPercentageWidth(68, context),
              ),
              Expanded(
                child: Material(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: figmaSpaceToPercentage(49, context),
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
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: figmaSpaceToPercentage(21, context)),
                          child: Text(
                            widget.text,
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: figmaSpaceToPercentage(17, context),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: figmaSpaceToPercentage(35, context),
          ),
          Expanded(
            child: Material(
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  //height: figmaSpaceToPercentage(580, context),
                  padding: const EdgeInsets.only(left: 1),
                  margin: const EdgeInsets.only(left: 1),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(243, 243, 243, 1),
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                  child: Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(25, context),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(
                                height: figmaSpaceToPercentage(20, context),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Details:',
                                    style: TextStyle(
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize:
                                          figmaSpaceToPercentage(21, context),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  SizedBox(
                                    width: figmaSpaceToPercentageWidth(
                                        250, context),
                                  ),
                                  if (!isEditing) // Show editing icon only if not editing
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isEditing =
                                              !isEditing; // Switch to editing mode
                                        });
                                      },
                                      child: Image.asset(
                                        ImageConstant.edit,
                                        height:
                                            figmaSpaceToPercentage(28, context),
                                        width: figmaSpaceToPercentageWidth(
                                            28, context),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                ],
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: _descriptionController,
                                        enabled: isEditing,
                                        // Enable/disable editing based on isEditing state
                                        maxLines: null,
                                        // Allow multiple lines of text
                                        keyboardType: TextInputType.multiline,
                                        // Allow multiline input
                                        decoration: InputDecoration(
                                          hintText: "Describe your issue here",
                                          hintStyle: TextStyle(
                                            color: const Color.fromRGBO(
                                              50,
                                              50,
                                              50,
                                              0.6,
                                            ),
                                            fontSize: figmaSpaceToPercentage(
                                                17, context),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                          contentPadding: const EdgeInsets.only(
                                            right: 25,
                                            bottom: 10,
                                            top: 20,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        style: TextStyle(
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: figmaSpaceToPercentage(
                                            17,
                                            context,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textInputAction: TextInputAction.done,
                                      ),
                                      SizedBox(
                                        height: figmaSpaceToPercentage(
                                          15,
                                          context,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 25),
                                        child: Row(children: [
                                          Expanded(
                                            child: Divider(
                                              color: Colors.black,
                                              thickness: 1.0,
                                            ),
                                          ),
                                        ]),
                                      ),
                                      Row(
                                        children: [
                                          //SizedBox(width: figmaSpaceToPercentageWidth(30, context)),
                                          Container(
                                            height: figmaSpaceToPercentage(
                                              150,
                                              context,
                                            ),
                                            width: figmaSpaceToPercentageWidth(
                                              200,
                                              context,
                                            ),
                                            color: Colors.transparent,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height:
                                                      figmaSpaceToPercentage(
                                                    15,
                                                    context,
                                                  ),
                                                ),
                                                Text(
                                                  "XyZ Part",
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromRGBO(
                                                        0,
                                                        0,
                                                        0,
                                                        1,
                                                      ),
                                                      fontSize:
                                                          figmaSpaceToPercentage(
                                                        23,
                                                        context,
                                                      ),
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                SizedBox(
                                                  height:
                                                      figmaSpaceToPercentage(
                                                    1,
                                                    context,
                                                  ),
                                                ),
                                                Text(
                                                  "Service Charges",
                                                  style: TextStyle(
                                                    color: const Color.fromRGBO(
                                                      0,
                                                      0,
                                                      0,
                                                      1,
                                                    ),
                                                    fontSize:
                                                        figmaSpaceToPercentage(
                                                      23,
                                                      context,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      figmaSpaceToPercentage(
                                                    1,
                                                    context,
                                                  ),
                                                ), // Adjust space between '|' and 'rs50' as needed
                                                Text(
                                                  "Total",
                                                  style: TextStyle(
                                                    color: const Color.fromRGBO(
                                                      0,
                                                      0,
                                                      0,
                                                      1,
                                                    ),
                                                    fontSize:
                                                        figmaSpaceToPercentage(
                                                      24,
                                                      context,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: figmaSpaceToPercentageWidth(
                                              20,
                                              context,
                                            ),
                                          ),
                                          Container(
                                            width:
                                                1, // Width of the vertical line
                                            height: figmaSpaceToPercentage(
                                              120,
                                              context,
                                            ), // Height of the vertical line
                                            color: Colors
                                                .black, // Color of the vertical line
                                          ),
                                          SizedBox(
                                            width: figmaSpaceToPercentageWidth(
                                              20,
                                              context,
                                            ),
                                          ),
                                          Container(
                                            height: figmaSpaceToPercentage(
                                              150,
                                              context,
                                            ),
                                            width: figmaSpaceToPercentageWidth(
                                              150,
                                              context,
                                            ),
                                            color: Colors.transparent,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height:
                                                      figmaSpaceToPercentage(
                                                    15,
                                                    context,
                                                  ),
                                                ),
                                                Text(
                                                  "Rs. 9500",
                                                  style: TextStyle(
                                                    color: const Color.fromRGBO(
                                                      0,
                                                      0,
                                                      0,
                                                      1,
                                                    ),
                                                    fontSize:
                                                        figmaSpaceToPercentage(
                                                      23,
                                                      context,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      figmaSpaceToPercentage(
                                                    1,
                                                    context,
                                                  ),
                                                ),
                                                Text(
                                                  "Rs. 1500",
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromRGBO(
                                                              0, 0, 0, 1),
                                                      fontSize:
                                                          figmaSpaceToPercentage(
                                                        23,
                                                        context,
                                                      ),
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                SizedBox(
                                                  height:
                                                      figmaSpaceToPercentage(
                                                    1,
                                                    context,
                                                  ),
                                                ), // Adjust space between '|' and 'rs50' as needed
                                                Text(
                                                  "Rs. 11000",
                                                  style: TextStyle(
                                                    color: const Color.fromRGBO(
                                                      0,
                                                      0,
                                                      0,
                                                      1,
                                                    ),
                                                    fontSize:
                                                        figmaSpaceToPercentage(
                                                      24,
                                                      context,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: figmaSpaceToPercentage(
                                          20,
                                          context,
                                        ),
                                      ),
                                      if (isEditing)
                                        Row(
                                          children: [
                                            SizedBox(
                                              width:
                                                  figmaSpaceToPercentageWidth(
                                                5,
                                                context,
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  isEditing =
                                                      !isEditing; // Toggle editing mode
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    100,
                                                  ),
                                                ),
                                                elevation:
                                                    5, // Specify the elevation
                                                backgroundColor: const Color(
                                                  0xFF5FBD34,
                                                ), // Background color
                                              ),
                                              child: SizedBox(
                                                width:
                                                    figmaSpaceToPercentageWidth(
                                                  366,
                                                  context,
                                                ),
                                                height: figmaSpaceToPercentage(
                                                  40,
                                                  context,
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Done',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .white, // Text color
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      SizedBox(
                                        height: figmaSpaceToPercentage(
                                          10,
                                          context,
                                        ),
                                      ),
                                      if (isEditing)
                                        Row(children: [
                                          SizedBox(
                                            width: figmaSpaceToPercentageWidth(
                                              5,
                                              context,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                isEditing =
                                                    !isEditing; // Toggle editing mode
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  100,
                                                ),
                                              ),
                                              // Specify the elevation
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      201, 201, 201, 1),
                                              foregroundColor:
                                                  const Color.fromRGBO(
                                                      201,
                                                      201,
                                                      201,
                                                      1), // Background color
                                            ),
                                            child: SizedBox(
                                              width:
                                                  figmaSpaceToPercentageWidth(
                                                366,
                                                context,
                                              ),
                                              height: figmaSpaceToPercentage(
                                                40,
                                                context,
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'PENDING',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors
                                                        .white, // Text color
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      SizedBox(
                                        height: figmaSpaceToPercentage(
                                          10,
                                          context,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// title: Text(widget.categoryName), // Show category name in app bar

// body: Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text('Detail for: ${widget.text}', style: TextStyle(fontSize: 24)),
//       Text('Category: ${widget.categoryName}', style: TextStyle(fontSize: 20, color: Colors.grey)),
