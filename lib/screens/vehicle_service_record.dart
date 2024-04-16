import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:car_care/widgets/service_card.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';

class VehicleServicRecord extends StatefulWidget {
  const VehicleServicRecord({Key? key}) : super(key: key);

  @override
  State<VehicleServicRecord> createState() => _VehicleServicRecordState();
}

class _VehicleServicRecordState extends State<VehicleServicRecord> {
  @override
  List<String> items = [
    "HONDA CIVIC (LHR-9856) - 1",
    "AUDI A8 (ISL -1111) - 2",
    "HONDA CIVIC (LHR-9856) - 3",
    "HONDA CIVIC (LHR-9856) - 4",
    "HONDA CIVIC (LHR-9856) - 5",
    // Add more items as needed
  ];
  ScrollController _controller = ScrollController();
  int currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                    child: Image.asset(
                      ImageConstant.Actions,
                      height: figmaSpaceToPercentage(20, context),
                      width: figmaSpaceToPercentageWidth(20, context),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: figmaSpaceToPercentage(45, context),
              ),
              Row(
                children: [
                  SizedBox(
                    width: figmaSpaceToPercentageWidth(33, context),
                  ),
                  Text(
                    "Mechanical Repairs",
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(21, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
          
              SizedBox(height: figmaSpaceToPercentage(24, context),),
              SingleChildScrollView(
                    child: Column(
                      children: [

                        ServiceRecordWidget(
                          text: "HONDA CIVIC (LHR-9856)",
                        ),
                        ServiceRecordWidget(
                          text: "AUDI A8 (ISL -1111)",
                        ),

                        ServiceRecordWidget(
                          text: "HONDA CIVIC (LHR-9856)",
                        ),
                        ServiceRecordWidget(
                          text: "HONDA CIVIC (LHR-9856)",
                        ),
                        ServiceRecordWidget(
                          text: "HONDA CIVIC (LHR-9856)",
                        ),


                      ],
                    ),
                  ),
          
                 SizedBox(
                   height: figmaSpaceToPercentage(20, context),
                 ),
              Row(
                children: [
                  SizedBox(
                    width: figmaSpaceToPercentageWidth(33, context),
                  ),
                  Text(
                    "Electrical Repairs",
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(21, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              SizedBox(height: figmaSpaceToPercentage(24, context),),
          // Define a list of items

       // Variable to keep track of the current index
       //        SizedBox(
       //          // Remove the fixed height
       //          // height: figmaSpaceToPercentage(300, context),
       //          child: ListView.builder(
       //            itemCount: (currentIndex + 3).clamp(0, items.length), // Show only 3 items at a time
       //            itemBuilder: (BuildContext context, int index) {
       //              return Column(
       //                children: [
       //                  ServiceRecordWidget(
       //                    text: items[index], // Get the item from the list
       //                  ),
       //                  SizedBox(height: 8), // Adjust the spacing between each ServiceRecordWidget
       //                ],
       //              );
       //            },
       //            // Use the _controller to track scroll position
       //            controller: _controller,
       //          ),
       //        ),





    ],
          ),
        ),
      ),
    );
  }
}
