import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';

class WorkshopHomepage extends StatefulWidget {
  const WorkshopHomepage({super.key});

  @override
  State<WorkshopHomepage> createState() => _WorkshopHomepageState();
}

class _WorkshopHomepageState extends State<WorkshopHomepage> {
  double _rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
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
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(361, context),
                    ),
                    Container(
                      width: figmaSpaceToPercentageWidth(60, context),
                      height: figmaSpaceToPercentage(40, context),
                      padding: const EdgeInsets.only(left: 1),
                      margin: const EdgeInsets.only(left: 1),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),


                      ),
                      child:Image.asset(
                        ImageConstant.setting,
                        height: figmaSpaceToPercentage(23, context),
                        width: figmaSpaceToPercentageWidth(25, context),
                        alignment: Alignment.center,

                      ),

                    ),
                  ],
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(6, context),
                ),

                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(45, context),
                    ),

                    Text(
                    "WAQAR AUTOS",
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(14, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ]
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(7, context),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(45, context),
                    ),
                    Text(
                      "Address:",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(14, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(4, context),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.5,
                          ),
                          child: Text(
                            "53 R Block Rd, Block R Phase 2 Johar Town, Lahore",
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: figmaSpaceToPercentage(14, context),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(7, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(45, context),
                    ),
                    Text(
                      "Contact:",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(14, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(4, context),
                    ),
                     Text(
                        "(+92) 123-6957495",
                        style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: figmaSpaceToPercentage(14, context),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
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
                      width: figmaSpaceToPercentageWidth(45, context),
                    ),
                    Text(
                      "Opening Hours:",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(14, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(4, context),
                    ),
                    Text(
                      "10 am - 10 pm",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(14, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),

                    ),

                  ],
                ),
                  SizedBox(
                    height: figmaSpaceToPercentage(5, context),
                  ),

                  Row(
                    children:[ 
                      
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(45, context),
                      ),
                      RatingBar.builder(
                    initialRating: _rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: figmaSpaceToPercentage(20, context),
                     itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _rating = rating;
                      });
                    },
                    glowColor: Colors.amber, // Specify the glow color here
                                    ),
          ]
                  ),
                 SizedBox(
                   height: figmaSpaceToPercentage(77, context),
                 ),
                Center(
                  child: Text(
                    "SERVICES",
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(18, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),

                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(10, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(45, context),
                    ),
                    InkWell(
                      onTap: ()
                      {

                      },
                      child: Container(
                        width: figmaSpaceToPercentageWidth(159, context),
                        height: figmaSpaceToPercentage(150, context),
                        padding: const EdgeInsets.only(left: 1),
                        margin: const EdgeInsets.only(left: 1),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(236, 236, 236, 0.77),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 5,
                              inset: true,
                              offset: const Offset(1, 4),
                            ),
                          ],
                        ),
                        child:Image.asset(
                          ImageConstant.electricalrepairs,
                          height: figmaSpaceToPercentage(150, context),
                          width: figmaSpaceToPercentageWidth(159, context),

                        ),

                      ),
                    ),
                    
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(20, context),
                    ),
                    InkWell(
                      onTap: ()
                      {

                      },
                      child: Container(
                        width: figmaSpaceToPercentageWidth(159, context),
                        height: figmaSpaceToPercentage(150, context),
                        padding: const EdgeInsets.only(left: 1),
                        margin: const EdgeInsets.only(left: 1),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(236, 236, 236, 0.77),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 5,
                              inset: true,
                              offset: const Offset(1, 4),
                            ),
                          ],
                        ),
                        child:Image.asset(
                          ImageConstant.mechanical,
                          height: figmaSpaceToPercentage(150, context),
                          width: figmaSpaceToPercentageWidth(159, context),

                        ),

                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(30, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(45, context),
                    ),
                    InkWell(
                      onTap: ()
                      {

                      },
                      child: Container(
                        width: figmaSpaceToPercentageWidth(159, context),
                        height: figmaSpaceToPercentage(150, context),
                        padding: const EdgeInsets.only(left: 1),
                        margin: const EdgeInsets.only(left: 1),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(236, 236, 236, 0.77),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 5,
                              inset: true,
                              offset: const Offset(1, 4),
                            ),
                          ],
                        ),
                        child:Image.asset(
                          ImageConstant.dentingNpainting,
                          height: figmaSpaceToPercentage(150, context),
                          width: figmaSpaceToPercentageWidth(159, context),

                        ),

                      ),
                    ),

                    SizedBox(
                      width: figmaSpaceToPercentageWidth(20, context),
                    ),
                    InkWell(
                      onTap: ()
                      {

                      },
                      child: Container(
                        width: figmaSpaceToPercentageWidth(159, context),
                        height: figmaSpaceToPercentage(150, context),
                        padding: const EdgeInsets.only(left: 1),
                        margin: const EdgeInsets.only(left: 1),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(236, 236, 236, 0.77),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 5,
                              inset: true,
                              offset: const Offset(1, 4),
                            ),
                          ],
                        ),
                        child:Image.asset(
                          ImageConstant.tireservices,
                          height: figmaSpaceToPercentage(150, context),
                          width: figmaSpaceToPercentageWidth(159, context),

                        ),

                      ),
                    ),

                  ],
                )

              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            ImageConstant.wrenchtool,
            height: figmaSpaceToPercentage(240, context),
            width: figmaSpaceToPercentageWidth(300, context),
            fit: BoxFit.cover,
          ),
        ),

      ],
    );
  }
}
