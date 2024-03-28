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

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
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
             height:  figmaSpaceToPercentage(68, context),
             ),
             Row(
                 children: [
                   SizedBox(
                     width:  figmaSpaceToPercentage(30, context),
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
                   width:  figmaSpaceToPercentage(41, context),
                 ),
                 Container(
                 width: figmaSpaceToPercentage(352, context),
                 height: figmaSpaceToPercentage(40, context),
                 padding: EdgeInsets.only(left:figmaSpaceToPercentage(26, context),top:figmaSpaceToPercentage(10, context),bottom: figmaSpaceToPercentage(11, context)),

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
                     width:  figmaSpaceToPercentage(54, context),
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
                     width:  figmaSpaceToPercentage(41, context),
                   ),
                   Container(
                     width: figmaSpaceToPercentage(352, context),
                     height: figmaSpaceToPercentage(40, context),
                     padding: EdgeInsets.only(left:figmaSpaceToPercentage(26, context),top:figmaSpaceToPercentage(10, context),bottom: figmaSpaceToPercentage(11, context)),

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
                     width:  figmaSpaceToPercentage(54, context),
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
                     width:  figmaSpaceToPercentage(41, context),
                   ),
                   Container(
                     width: figmaSpaceToPercentage(352, context),
                     height: figmaSpaceToPercentage(40, context),
                     padding: EdgeInsets.only(left:figmaSpaceToPercentage(26, context),top:figmaSpaceToPercentage(10, context),bottom: figmaSpaceToPercentage(11, context)),

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
                     width:  figmaSpaceToPercentage(54, context),
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
                     width:  figmaSpaceToPercentage(41, context),
                   ),
                   Container(
                     width: figmaSpaceToPercentage(352, context),
                     height: figmaSpaceToPercentage(40, context),
                     padding: EdgeInsets.only(left:figmaSpaceToPercentage(26, context),top:figmaSpaceToPercentage(10, context),bottom: figmaSpaceToPercentage(11, context)),

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
                     width:  figmaSpaceToPercentage(54, context),
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
                     width:  figmaSpaceToPercentage(41, context),
                   ),
                   Container(
                     width: figmaSpaceToPercentage(150, context),
                     height: figmaSpaceToPercentage(40, context),
                     padding: EdgeInsets.only(left:figmaSpaceToPercentage(26, context),top:figmaSpaceToPercentage(10, context),bottom: figmaSpaceToPercentage(11, context)),

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
                     width:  figmaSpaceToPercentage(54, context),
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
                       width:  figmaSpaceToPercentage(41, context),
                     ),
                  Container(
               width: 350,
               height: 100,
               padding: EdgeInsets.only(left: 1),
               margin: EdgeInsets.only(left: 1),
            decoration: BoxDecoration(
        color: const Color.fromRGBO(236, 236, 236, 0.77),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),

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
             ),
             SizedBox(
               height: 10,

             ),
                   ],
                 )
           ],

        ),
      ),
    );
  }
}
