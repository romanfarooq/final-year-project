import '../utils/image_constant.dart';
import 'package:car_care/functions/figmaSpaceToPercentage.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';



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
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children:[ Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(
                   height: figmaSpaceToPercentage(55, context),
                 ),
                 Center(
                    child:  Image.asset(
                      ImageConstant.carcare1,
                      height: 29,
                      width: 106,
                      alignment: Alignment.center,
                    ),
                 ),
                 SizedBox(
                 height:  figmaSpaceToPercentage(50, context),
                 ),
                 Row(
                     children: [
                       SizedBox(
                         width:  figmaSpaceToPercentageWidth(30, context),
                       ),
                       Container(

                         child: Text(
                           "Workshop Name:",
                           style: TextStyle(
                             color:Color.fromRGBO(0, 0, 0, 1),
                             fontSize:  figmaSpaceToPercentage(14, context),
                             fontFamily: 'Inter',
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                       ),
                     ]
                 ),
                 SizedBox(
                   height:  figmaSpaceToPercentage(5, context),
                 ),

                 Row(
                   children:[
                     SizedBox(
                       width:  figmaSpaceToPercentageWidth(20, context),
                     ),
                     Container(
                     width: figmaSpaceToPercentageWidth(352, context),
                     height: figmaSpaceToPercentage(40, context),
                     padding: EdgeInsets.only(left:figmaSpaceToPercentageWidth(26, context),top:figmaSpaceToPercentage(10, context)),

                     decoration: BoxDecoration(
                       color:  Color.fromRGBO(66, 84, 164, 0.49),
                       borderRadius:  BorderRadius.only(
                         topRight: Radius.circular(25),
                         bottomRight: Radius.circular(25),
                         topLeft: Radius.circular(25),
                         bottomLeft: Radius.circular(25),

                       ),
                     ),
                       child: TextField(
                         controller: _workshopnameController,
                         decoration: InputDecoration(
                           hintText: "Abc Auto Care",
                           hintStyle: TextStyle(
                             color: Color.fromRGBO(50, 50, 50, 0.6),
                             fontSize: figmaSpaceToPercentage(14, context),
                             fontFamily: 'Inter',
                             fontWeight: FontWeight.w500,
                           ),
                           border: InputBorder.none,
                         ),
                         style: TextStyle(
                           color: Color.fromRGBO(0, 0, 0, 1),
                           fontSize: figmaSpaceToPercentage(14, context),
                           fontFamily: 'Inter',
                           fontWeight: FontWeight.w500,
                         ),
                         textInputAction: TextInputAction.done,
                         keyboardType: TextInputType.text,
                       ),
                     ),
                ]
                 ),
                 SizedBox(
                   height:  figmaSpaceToPercentage(12, context),
                 ),

                 Row(
                     children: [
                       SizedBox(
                         width:  figmaSpaceToPercentageWidth(30, context),
                       ),
                       Container(

                         child: Text(
                           "Location:",
                           style: TextStyle(
                             color:Color.fromRGBO(0, 0, 0, 1),
                             fontSize:  figmaSpaceToPercentage(14, context),
                             fontFamily: 'Inter',
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                       ),
                     ]
                 ),
                 SizedBox(
                   height:  figmaSpaceToPercentage(4, context),
                 ),
                 Row(
                     children:[
                       SizedBox(
                         width:  figmaSpaceToPercentageWidth(20, context),
                       ),
                       Container(
                         width: figmaSpaceToPercentageWidth(352, context),
                         height: figmaSpaceToPercentage(40, context),
                         padding: EdgeInsets.only(left:figmaSpaceToPercentage(26, context),top:figmaSpaceToPercentage(10, context)),

                         decoration: BoxDecoration(
                           color:  Color.fromRGBO(66, 84, 164, 0.49),
                           borderRadius:  BorderRadius.only(
                             topRight: Radius.circular(25),
                             bottomRight: Radius.circular(25),
                             topLeft: Radius.circular(25),
                             bottomLeft: Radius.circular(25),

                           ),
                         ),
                         child: TextField(
                           controller: _locationController,
                           decoration: InputDecoration(
                             hintText: "123 Main Street, City",
                             hintStyle: TextStyle(
                               color: Color.fromRGBO(50, 50, 50, 0.6),
                               fontSize: figmaSpaceToPercentage(14, context),
                               fontFamily: 'Inter',
                               fontWeight: FontWeight.w500,
                             ),
                             border: InputBorder.none,
                           ),
                           style: TextStyle(
                             color: Color.fromRGBO(0, 0, 0, 1),
                             fontSize: figmaSpaceToPercentage(14, context),
                             fontFamily: 'Inter',
                             fontWeight: FontWeight.w500,
                           ),
                           textInputAction: TextInputAction.done,
                           keyboardType: TextInputType.text,
                         ),
                       ),
                     ]
                 ),

                 SizedBox(
                   height:  figmaSpaceToPercentage(12, context),
                 ),

                 Row(
                     children: [
                       SizedBox(
                         width:  figmaSpaceToPercentageWidth(30, context),
                       ),
                       Container(

                         child: Text(
                           "Contact Information:",
                           style: TextStyle(
                             color:Color.fromRGBO(0, 0, 0, 1),
                             fontSize:  figmaSpaceToPercentage(14, context),
                             fontFamily: 'Inter',

                             fontWeight: FontWeight.w600,
                           ),
                         ),
                       ),
                     ]
                 ),
                 SizedBox(
                   height:  figmaSpaceToPercentage(4, context),
                 ),

                 Row(
                     children:[
                       SizedBox(
                         width:  figmaSpaceToPercentageWidth(20, context),
                       ),
                       Container(
                         width: figmaSpaceToPercentageWidth(352, context),
                         height: figmaSpaceToPercentage(40, context),
                         padding: EdgeInsets.only(left:figmaSpaceToPercentage(26, context),top:figmaSpaceToPercentage(10, context)),

                         decoration: BoxDecoration(
                           color:  Color.fromRGBO(66, 84, 164, 0.49),
                           borderRadius:  BorderRadius.only(
                             topRight: Radius.circular(25),
                             bottomRight: Radius.circular(25),
                             topLeft: Radius.circular(25),
                             bottomLeft: Radius.circular(25),

                           ),
                         ),
                         child: TextField(
                           controller: _contactController,
                           decoration: InputDecoration(
                             hintText: "(+92) 123-6957495",
                             hintStyle: TextStyle(
                               color: Color.fromRGBO(50, 50, 50, 0.6),
                               fontSize: figmaSpaceToPercentage(14, context),
                               fontFamily: 'Inter',
                               fontWeight: FontWeight.w500,
                             ),
                             border: InputBorder.none,
                           ),
                           style: TextStyle(
                             color: Color.fromRGBO(0, 0, 0, 1),
                             fontSize: figmaSpaceToPercentage(14, context),
                             fontFamily: 'Inter',
                             fontWeight: FontWeight.w500,
                           ),
                           textInputAction: TextInputAction.done,
                           keyboardType: TextInputType.text,
                         ),
                       ),
                     ]
                 ),


                 SizedBox(
                   height:  figmaSpaceToPercentage(12, context),
                 ),
                 Row(
                     children: [
                       SizedBox(
                         width:  figmaSpaceToPercentageWidth(30, context),
                       ),
                       Container(

                         child: Text(
                           "Website: (optional)",
                           style: TextStyle(
                             color:Color.fromRGBO(0, 0, 0, 1),
                             fontSize:  figmaSpaceToPercentage(14, context),
                             fontFamily: 'Inter',
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                       ),
                     ]
                 ),
                 SizedBox(
                   height:  figmaSpaceToPercentage(4, context),
                 ),

                 Row(
                     children:[
                       SizedBox(
                         width:  figmaSpaceToPercentageWidth(20, context),
                       ),
                       Container(
                         width: figmaSpaceToPercentageWidth(352, context),
                         height: figmaSpaceToPercentage(40, context),
                         padding: EdgeInsets.only(left:figmaSpaceToPercentage(26, context),top:figmaSpaceToPercentage(10, context)),

                         decoration: BoxDecoration(
                           color:  Color.fromRGBO(66, 84, 164, 0.49),
                           borderRadius:  BorderRadius.only(
                             topRight: Radius.circular(25),
                             bottomRight: Radius.circular(25),
                             topLeft: Radius.circular(25),
                             bottomLeft: Radius.circular(25),

                           ),
                         ),
                         child: TextField(
                           controller: _websiteController,
                           decoration: InputDecoration(
                             hintText: "www.carecarepro.com",
                             hintStyle: TextStyle(
                               color: Color.fromRGBO(50, 50, 50, 0.6),
                               fontSize: figmaSpaceToPercentage(14, context),
                               fontFamily: 'Inter',
                               fontWeight: FontWeight.w500,
                             ),
                             border: InputBorder.none,
                           ),
                           style: TextStyle(
                             color: Color.fromRGBO(0, 0, 0, 1),
                             fontSize: figmaSpaceToPercentage(14, context),
                             fontFamily: 'Inter',

                             fontWeight: FontWeight.w500,
                           ),
                           textInputAction: TextInputAction.done,
                           keyboardType: TextInputType.text,
                         ),
                       ),
                     ]
                 ),

                 SizedBox(
                   height:  figmaSpaceToPercentage(12, context),
                 ),
                 Row(
                     children: [
                       SizedBox(
                         width:  figmaSpaceToPercentageWidth(30, context),
                       ),
                       Container(

                         child: Text(
                           "Opening Hours:",
                           style: TextStyle(
                             color:Color.fromRGBO(0, 0, 0, 1),
                             fontSize:  figmaSpaceToPercentage(14, context),
                             fontFamily: 'Inter',
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                       ),
                     ]
                 ),
                 SizedBox(
                   height:  figmaSpaceToPercentage(4, context),
                 ),


                 Row(
                     children:[
                       SizedBox(
                         width:  figmaSpaceToPercentageWidth(20, context),
                       ),
                       Container(
                         width: figmaSpaceToPercentageWidth(150, context),
                         height: figmaSpaceToPercentage(40, context),
                         padding: EdgeInsets.only(left:figmaSpaceToPercentage(26, context),top:figmaSpaceToPercentage(10, context)),

                         decoration: BoxDecoration(
                           color:  Color.fromRGBO(66, 84, 164, 0.49),
                           borderRadius:  BorderRadius.only(
                             topRight: Radius.circular(25),
                             bottomRight: Radius.circular(25),
                             topLeft: Radius.circular(25),
                             bottomLeft: Radius.circular(25),

                           ),
                         ),
                         child: TextField(
                           controller: _openinghoursController,
                           decoration: InputDecoration(
                             hintText: "10 am - 10 pm",
                             hintStyle: TextStyle(
                               color: Color.fromRGBO(50, 50, 50, 0.6),
                               fontSize: figmaSpaceToPercentage(14, context),
                               fontFamily: 'Inter',
                               fontWeight: FontWeight.w500,
                             ),
                             border: InputBorder.none,
                           ),
                           style: TextStyle(
                             color: Color.fromRGBO(0, 0, 0, 1),
                             fontSize: figmaSpaceToPercentage(14, context),
                             fontFamily: 'Inter',

                             fontWeight: FontWeight.w500,
                           ),
                           textInputAction: TextInputAction.done,
                           keyboardType: TextInputType.text,
                         ),
                       ),
                     ]
                 ),

                 SizedBox(
                   height:  figmaSpaceToPercentage(12, context),
                 ),
                 Row(
                     children: [
                       SizedBox(
                         width:  figmaSpaceToPercentageWidth(30, context),
                       ),
                       Container(

                         child: Text(
                           "Additional Notes: (optional)",
                           style: TextStyle(
                             color:Color.fromRGBO(0, 0, 0, 1),
                             fontSize:  figmaSpaceToPercentage(14, context),
                             fontFamily: 'Inter',
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                       ),
                     ]
                 ),
                 SizedBox(
                   height:  figmaSpaceToPercentage(10, context),
                 ),
                     Row(
                       children: [
                         SizedBox(
                           width:  figmaSpaceToPercentageWidth(20, context),
                         ),
                         Container(
                           width: figmaSpaceToPercentageWidth(350, context),
                           height: 150,
                           padding: EdgeInsets.only(left: 1),
                           margin: EdgeInsets.only(left: 1),
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
                             keyboardType: TextInputType.multiline, // Allow multiline input
                             decoration: InputDecoration(
                               hintText: "Enter your description here",
                               hintStyle: TextStyle(
                                 color: Color.fromRGBO(50, 50, 50, 0.6),
                                 fontSize: figmaSpaceToPercentage(14, context),
                                 fontFamily: 'Inter',
                                 fontWeight: FontWeight.w500,
                               ),
                               contentPadding: EdgeInsets.all(10), // Add padding to the hint text
                               border: InputBorder.none,
                             ),
                             style: TextStyle(
                               color: Color.fromRGBO(0, 0, 0, 1),
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
                   height: figmaSpaceToPercentage(40, context),

                 ),

                         Row(
                           children:[

                             SizedBox(
                               width: figmaSpaceToPercentageWidth(20, context),

                             ),
                             ElevatedButton(
                             onPressed: () {
                               // Add your onPressed logic here
                             },
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Color.fromRGBO(96, 189, 52, 1), // Change the button's background color
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(25), // Adjust the radius as needed
                               ),
                               minimumSize: Size(figmaSpaceToPercentageWidth(93, context), figmaSpaceToPercentage(40, context)), // Set the button's width and height
                             ),
                             child: Text(
                               "Next",
                               textAlign: TextAlign.center, // Align the text in the center
                               style: TextStyle(fontSize: 16,
                                 color: Colors.white,
                               ), // Change the font size of the button text
                             ),
                           ),
        ]
                         ),




               ],

            ),
          ),

        ),
      ),
        Positioned(
          bottom: 10,
          right: 20,
          child: Image.asset(
            ImageConstant.wrenchtool,
            height: figmaSpaceToPercentage(140, context),
            width: figmaSpaceToPercentageWidth(250, context),
            fit: BoxFit.cover,
          ),
        ),
    ]
    );
  }
}
