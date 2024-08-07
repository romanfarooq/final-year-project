import 'package:flutter/material.dart';

import '../screens/service_history.dart';
import '../utils/figma_space_to_percentage.dart';

class ServiceHistoryDetail extends StatelessWidget {
  final String date;
  final String month;
  final String year;
  final String serviceType;

  const ServiceHistoryDetail({
    super.key,
    required this.date,
    required this.month,
    required this.year,
    required this.serviceType,
  });

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: figmaSpaceToPercentageHeight(15, context),
          ),

          Column(children: [
            Center(
              child: Text(
                'Service History',
                style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: figmaSpaceToPercentageHeight(26, context),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none),
              ),
            ),
          ]),

          SizedBox(
            height: figmaSpaceToPercentageHeight(25, context),
          ),
          //wa
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ServiceHistory()),
              );
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
                        fontSize: figmaSpaceToPercentageHeight(23, context),
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
                        fontSize: figmaSpaceToPercentageHeight(23, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: figmaSpaceToPercentageHeight(15, context),
                ),
                Row(
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
                            fontSize: figmaSpaceToPercentageHeight(96, context),
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
                                fontSize:
                                    figmaSpaceToPercentageHeight(43, context),
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
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: figmaSpaceToPercentageHeight(142, context),
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
                            height: figmaSpaceToPercentageHeight(140, context),
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

          SizedBox(height: figmaSpaceToPercentageHeight(4, context)),

          Row(
            children: [
              SizedBox(
                width: figmaSpaceToPercentageWidth(30, context),
              ),
              Text(
                'Details:',
                style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: figmaSpaceToPercentageHeight(23, context),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none),
              ),
            ],
          ),

          SizedBox(
            height: figmaSpaceToPercentageHeight(10, context),
          ),

          Row(
            children: [
              SizedBox(
                width: figmaSpaceToPercentageWidth(30, context),
              ),
              Text(
                "$serviceType Service ",
                style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: figmaSpaceToPercentageHeight(23, context),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none),
              ),
            ],
          ),

          SizedBox(
            height: figmaSpaceToPercentageHeight(5, context),
          ),

          Row(
            children: [
              SizedBox(
                width: figmaSpaceToPercentageWidth(30, context),
              ),
              Text(
                "Gujjar Automobiles",
                style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: figmaSpaceToPercentageHeight(23, context),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none),
              ),
            ],
          ),

          SizedBox(
            height: figmaSpaceToPercentageHeight(2, context),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ), // Add equal horizontal padding of 1 pixel
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    figmaSpaceToPercentageHeight(1, context),
                              ),
                              Text(
                                """The Toyota Altis 1.6 stands as a testament to reliability and practicality in the sedan market. Powered by a 1.6-liter engine, it strikes a balance between performance and fuel efficiency. Its sleek design, coupled with modern amenities like touchscreen infotainment systems and advanced safety features, offers both style and convenience. Inside, passengers enjoy ample space and comfort, while the sedan's smooth ride quality ensures an enjoyable driving experience. With Toyota's reputation for durability and low maintenance costs, the Altis 1.6 emerges as a compelling choice for those seeking a dependable and economical sedan. """,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize:
                                      figmaSpaceToPercentageHeight(20, context),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Row(
                    children: [
                      SizedBox(width: figmaSpaceToPercentageWidth(30, context)),
                      Container(
                        height: figmaSpaceToPercentageHeight(150, context),
                        width: figmaSpaceToPercentageWidth(200, context),
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height:
                                    figmaSpaceToPercentageHeight(15, context)),
                            Text(
                              "XyZ Part",
                              style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize:
                                      figmaSpaceToPercentageHeight(23, context),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(
                                height:
                                    figmaSpaceToPercentageHeight(1, context)),
                            Text(
                              "Service Charges",
                              style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize:
                                      figmaSpaceToPercentageHeight(23, context),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(
                              height: figmaSpaceToPercentageHeight(1, context),
                            ), // Adjust space between '|' and 'rs50' as needed
                            Text(
                              "Total",
                              style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize:
                                      figmaSpaceToPercentageHeight(24, context),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(20, context),
                      ),
                      Container(
                        width: 1, // Width of the vertical line
                        height: figmaSpaceToPercentageHeight(
                          120,
                          context,
                        ), // Height of the vertical line
                        color: Colors.black, // Color of the vertical line
                      ),
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(20, context),
                      ),
                      Container(
                        height: figmaSpaceToPercentageHeight(150, context),
                        width: figmaSpaceToPercentageWidth(150, context),
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: figmaSpaceToPercentageHeight(15, context),
                            ),
                            Text(
                              "Rs. 9500",
                              style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize:
                                      figmaSpaceToPercentageHeight(23, context),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(
                              height: figmaSpaceToPercentageHeight(1, context),
                            ),
                            Text(
                              "Rs. 1500",
                              style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize:
                                      figmaSpaceToPercentageHeight(23, context),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(
                              height: figmaSpaceToPercentageHeight(1, context),
                            ), // Adjust space between '|' and 'rs50' as needed
                            Text(
                              "Rs. 11000",
                              style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize:
                                      figmaSpaceToPercentageHeight(24, context),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
