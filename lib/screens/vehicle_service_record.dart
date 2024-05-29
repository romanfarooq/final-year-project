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
  late ScrollController _mechanicalController;
  late ScrollController _electricalController;
  late ScrollController _dentingController;
  late ScrollController _tiresController;

  @override
  void initState() {
    super.initState();
    _mechanicalController = ScrollController();
    _electricalController = ScrollController();
    _dentingController = ScrollController();
    _tiresController = ScrollController();
  }

  @override
  void dispose() {
    _mechanicalController.dispose();
    _electricalController.dispose();
    _dentingController.dispose();
    _tiresController.dispose();
    super.dispose();
  }


  List<String> mechanicalItems = [
    "HONDA CIVIC (LHR-9856)",
    "AUDI A8 (ISL -1111)",
    "HONDA CIVIC (LHR-9856)",
    "HONDA CIVIC (LHR-9856)",
    "HONDA CIVIC (LHR-9856)",
    // Add more items as needed
  ];

  List<String> electricalItems = [
    "HONDA CIVIC (LHR-9856)",
    "HONDA CIVIC (LHR-9856)",
    "HONDA CIVIC (LHR-9856)",
    "HONDA CIVIC (LHR-9856)",
    "HONDA CIVIC (LHR-9856)",
    // Add more items as needed
  ];

  List<String> dentingItems = [
    "Some denting item",
    "Another denting item",
    "One more denting item",
    // Add more items as needed
  ];

  List<String> tiresItems = [
    "Tire service item 1",
    "Tire service item 2",
    "Tire service item 3",
    // Add more items as needed
  ];

  int currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
       
            Expanded(
              child: SingleChildScrollView(
                        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: figmaSpaceToPercentage(55, context),
                ),
                // Your other widgets...
                        
                // Mechanical Repairs Section
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(33, context),
                    ),
                    Text(
                      "Mechanical Service",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(21, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none
                      ),
                    ),
                  ],
                ),
                SizedBox(height: figmaSpaceToPercentage(24, context)),
                SizedBox(
                  height: figmaSpaceToPercentage(200, context),
                  // Adjust the height as needed
                  child: ListView.builder(
                    itemCount: mechanicalItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ServiceRecordWidget(
                        categoryName: "Mechanical",
                        text: mechanicalItems[index],

                      );
                    },
                    controller: _mechanicalController,
                  ),
                ),
                SizedBox(height: figmaSpaceToPercentage(20, context)),
                        
                // Electrical Repairs Section
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(33, context),
                    ),
                    Text(
                      "Electrical Service",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(21, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: figmaSpaceToPercentage(24, context)),
                SizedBox(
                  height: figmaSpaceToPercentage(200, context),
                  // Adjust the height as needed
                  child: ListView.builder(
                    itemCount: electricalItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ServiceRecordWidget(

                        text: electricalItems[index],
                        categoryName: "Electrical",
                      );
                    },
                    controller: _electricalController,
                  ),
                ),
                SizedBox(height: figmaSpaceToPercentage(20, context)),
                        
                // Denting & Painting Section
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(33, context),
                    ),
                    Text(
                      "Denting & Painting Service",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(21, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: figmaSpaceToPercentage(24, context)),
                SizedBox(
                  height: figmaSpaceToPercentage(200, context),
                  // Adjust the height as needed
                  child: ListView.builder(
                    itemCount: dentingItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ServiceRecordWidget(
                        text: dentingItems[index],
                          categoryName: "Denting & Painting"
                      );
                    },
                    controller: _dentingController,
                  ),
                ),
                SizedBox(height: figmaSpaceToPercentage(20, context)),
                        
                // Tires Services Section
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(33, context),
                    ),
                    Text(
                      "Tire Service",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(21, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: figmaSpaceToPercentage(24, context)),
                SizedBox(
                  height: figmaSpaceToPercentage(200, context),
                  // Adjust the height as needed
                  child: ListView.builder(
                    itemCount: tiresItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ServiceRecordWidget(
                        text: tiresItems[index],
                          categoryName: "Tire"
                      );
                    },
                    controller: _tiresController,
                  ),
                ),
                SizedBox(height: figmaSpaceToPercentage(20, context)),
                        
                // Your other widgets...
              ],
                        ),
                      ),
            ),
      ],
        )
      ),
    );
  }
}
