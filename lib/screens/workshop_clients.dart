import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_profile_widget.dart';

class WorkshopClients extends StatefulWidget {
  const WorkshopClients({super.key});

  @override
  State<WorkshopClients> createState() => _WorkshopClientsState();
}

class _WorkshopClientsState extends State<WorkshopClients> {
  TextEditingController searchfieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          SizedBox(
            height: figmaSpaceToPercentage(30, context),
          ),
          Row(children: [
            SizedBox(width: figmaSpaceToPercentageWidth(5, context)),
            Material(
              child: Container(
                width: figmaSpaceToPercentageWidth(419, context),
                height: figmaSpaceToPercentage(36, context),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(
                      232, 232, 232, 1), // Background color
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: searchfieldController,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder
                        .none, // Remove the border from the TextField
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: figmaSpaceToPercentage(45, context),
          ),
          const Divider(
            thickness: 1, // Adjust the thickness of the line as needed
            color: Color.fromRGBO(
                174, 174, 174, 1), // Change the color of the line as needed
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: figmaSpaceToPercentage(10, context),
                  ),
                  CustomProfileWidget(
                    imageUrl:
                        ImageConstant.waqar, // Replace with your image path
                    name: 'Chaudhary Muhammad Waqar Hussain',
                    id: 'LEB-11-6947',
                  ),
                  CustomProfileWidget(
                    imageUrl:
                        ImageConstant.waqar, // Replace with your image path
                    name: 'Waqar Gujjar',
                    id: 'FDN-17-474',
                  ),
                  CustomProfileWidget(
                    imageUrl:
                        ImageConstant.waqar, // Replace with your image path
                    name: 'Waqar Gujjar',
                    id: 'FDN-17-474',
                  ),
                  CustomProfileWidget(
                    imageUrl:
                        ImageConstant.waqar, // Replace with your image path
                    name: 'Waqar Gujjar',
                    id: 'FDN-17-474',
                  ),
                  CustomProfileWidget(
                    imageUrl:
                        ImageConstant.waqar, // Replace with your image path
                    name: 'Waqar Gujjar',
                    id: 'FDN-17-474',
                  ),
                  CustomProfileWidget(
                    imageUrl:
                        ImageConstant.waqar, // Replace with your image path
                    name: 'Waqar Gujjar',
                    id: 'FDN-17-474',
                  ),
                  CustomProfileWidget(
                    imageUrl:
                        ImageConstant.waqar, // Replace with your image path
                    name: 'Waqar Gujjar',
                    id: 'FDN-17-474',
                  ),
                  CustomProfileWidget(
                    imageUrl:
                        ImageConstant.waqar, // Replace with your image path
                    name: 'Waqar Gujjar',
                    id: 'FDN-17-474',
                  ),
                  CustomProfileWidget(
                    imageUrl:
                        ImageConstant.waqar, // Replace with your image path
                    name: 'Waqar Gujjar',
                    id: 'FDN-17-474',
                  ),
                  CustomProfileWidget(
                    imageUrl:
                        ImageConstant.waqar, // Replace with your image path
                    name: 'Waqar Gujjar',
                    id: 'FDN-17-474',
                  ),
                  CustomProfileWidget(
                    imageUrl:
                        ImageConstant.waqar, // Replace with your image path
                    name: 'Chaudhary Muhammad Waqar Hussain',
                    id: 'LEB-11-6947',
                  )
                ], // add your widgets here
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchfieldController.dispose(); // Dispose of the controller
    super.dispose();
  }
}
