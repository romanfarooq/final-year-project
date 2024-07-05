import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/google_map_display.dart';

class CarEmergency extends StatefulWidget {
  const CarEmergency({super.key});

  @override
  State<CarEmergency> createState() => _CarEmergencyState();
}

class _CarEmergencyState extends State<CarEmergency> {
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final carUserInfo = context.read<UserCarsInfo>();
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: figmaSpaceToPercentageWidth(25, context),
              vertical: figmaSpaceToPercentageHeight(15, context),
            ),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Map',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -1,
              ),
            ),
          ),
          SizedBox(
            height: figmaSpaceToPercentageHeight(300, context),
            child: const GoogleMapDisplay(),
          ),
          Container(
            padding: EdgeInsets.only(
              left: figmaSpaceToPercentageWidth(25, context),
              top: figmaSpaceToPercentageHeight(20, context),
              bottom: figmaSpaceToPercentageHeight(15, context),
            ),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Issue Description',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -1,
              ),
            ),
          ),
          Container(
            width: figmaSpaceToPercentageWidth(400, context),
            height: figmaSpaceToPercentageHeight(280, context),
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
            child: TextField(
              controller: _descriptionController,
              maxLines: null,
              // Allow multiple lines of text
              keyboardType: TextInputType.multiline,
              // Allow multiline input
              decoration: InputDecoration(
                hintText: "e.g Car broke down, engine won't start",
                hintStyle: TextStyle(
                  color: const Color.fromRGBO(50, 50, 50, 0.6),
                  fontSize: figmaSpaceToPercentageHeight(17, context),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 20),
                // Add padding to the hint text
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontSize: figmaSpaceToPercentageHeight(17, context),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              textInputAction: TextInputAction.done,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomElevatedButton(
              text: "Confirm",
              buttonStyle: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  Colors.transparent,
                ),
                elevation: WidgetStateProperty.all<double>(0),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    figmaSpaceToPercentageWidth(20, context)),
                gradient: LinearGradient(
                  begin: const Alignment(0.5, 0),
                  end: const Alignment(0.5, 1),
                  colors: [
                    const Color(0XFF6E7CB9),
                    Theme.of(context).colorScheme.primary,
                  ],
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

AppBar appBar() {
  return AppBar(
    title: Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(10),
      child: Image.asset(ImageConstant.carcare1, height: 25),
    ),
    actions: [
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(217, 217, 217, 0.5),
              borderRadius: BorderRadius.circular(48),
              shape: BoxShape.rectangle,
            ),
            margin: const EdgeInsets.only(right: 5, top: 5, left: 10),
            width: 60,
            height: 38,
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ),
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(217, 217, 217, 0.5),
              borderRadius: BorderRadius.circular(48),
              shape: BoxShape.rectangle,
            ),
            margin: const EdgeInsets.only(
              right: 10,
              top: 5,
              left: 5,
            ),
            width: 60,
            height: 38,
            child: IconButton(
              icon: const Icon(Icons.messenger_rounded),
              onPressed: () {},
            ),
          ),
        ],
      ),
    ],
  );
}
