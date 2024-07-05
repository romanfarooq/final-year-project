import 'package:flutter/material.dart';

import '../utils/figma_space_to_percentage.dart';

class Billing extends StatelessWidget {
  const Billing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: figmaSpaceToPercentageHeight(15, context),
          ),
          Column(
            children: [
              Center(
                child: Text(
                  'Billing',
                  style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentageHeight(26, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none),
                ),
              ),
            ],
          ),
          SizedBox(
            height: figmaSpaceToPercentageHeight(25, context),
          ),
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
                            horizontal: 20,
                          ), // Add equal horizontal padding of 1 pixel
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align text to the start
                            children: [
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
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(76, 93, 169, 1),
                      padding: EdgeInsets.symmetric(
                        horizontal: figmaSpaceToPercentageWidth(20, context),
                        vertical: figmaSpaceToPercentageHeight(10, context),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: figmaSpaceToPercentageWidth(100, context),
                        vertical: figmaSpaceToPercentageHeight(10, context),
                      ),
                      child: Text(
                        'Pending',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: figmaSpaceToPercentageHeight(20, context),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentageHeight(30, context),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(96, 189, 52, 1),
                      padding: EdgeInsets.symmetric(
                        horizontal: figmaSpaceToPercentageWidth(20, context),
                        vertical: figmaSpaceToPercentageHeight(10, context),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: figmaSpaceToPercentageWidth(100, context),
                        vertical: figmaSpaceToPercentageHeight(10, context),
                      ),
                      child: Text(
                        'Satisfied',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: figmaSpaceToPercentageHeight(20, context),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
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
