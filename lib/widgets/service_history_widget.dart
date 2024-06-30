import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../screens/service_history_details.dart';
import '../utils/figma_space_to_percentage.dart';

class ServiceHistoryWidget extends StatelessWidget {
  final String date;
  final String month;
  final String year;
  final String serviceType;
  //final VoidCallback onTap;

  const ServiceHistoryWidget({
    super.key,
    required this.date,
    required this.month,
    required this.year,
    required this.serviceType,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    //print("Building ServiceHistoryWidget with date: $date, month: $month, year: $year, ");
    // Function to get the image path based on the service type
    String getImagePath(String serviceType) {
      switch (serviceType) {
        case 'Mechanical':
          return 'assets/images/mechanical1.png';
        case 'Electrical':
          return 'assets/images/power1.png';
        case 'DentingNpainting':
          return 'assets/images/dentingNpainting1.png';
        case 'Tire':
          return 'assets/images/tireservices1.png';
        default:
          return 'assets/images/setting.png';
      }
    }

    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ServiceHistoryDetail(
                  date: date,
                  month: month,
                  year: year,
                  serviceType: serviceType)));
        },
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: figmaSpaceToPercentageWidth(30, context),
                ),
                Text(
                  month,
                  style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: figmaSpaceToPercentage(23, context),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  width: figmaSpaceToPercentageWidth(5, context),
                ),
                Text(
                  year,
                  style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: figmaSpaceToPercentage(23, context),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: figmaSpaceToPercentage(15, context),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: figmaSpaceToPercentageWidth(44, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(96, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 0),
                        Text(
                          'Th',
                          style: TextStyle(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: figmaSpaceToPercentage(43, context),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: figmaSpaceToPercentageWidth(4, context),
                ),
                Expanded(
                  // flex: 1,
                  // fit: FlexFit.tight,
                  child: Container(
                    height: figmaSpaceToPercentage(142, context),
                    width: figmaSpaceToPercentageWidth(213, context),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(71),
                        bottomLeft: Radius.circular(71),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        getImagePath(serviceType),
                        height: figmaSpaceToPercentage(140, context),
                        width: figmaSpaceToPercentageWidth(160, context),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
