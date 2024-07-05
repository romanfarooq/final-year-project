import 'package:car_care/models/car_info.dart';
import 'package:car_care/models/service_history.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';

import '../utils/figma_space_to_percentage.dart';

class RepairDetails extends StatefulWidget {
  final String text;
  final String repairType;

  const RepairDetails({
    super.key,
    required this.text,
    required this.repairType,
  });

  @override
  State<RepairDetails> createState() => _RepairDetailsState();
}

class _RepairDetailsState extends State<RepairDetails> {
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String getImagePath(String serviceType) {
      switch (serviceType) {
        case 'Mechanical':
          return 'assets/images/mechanical1.png';
        case 'Electrical':
          return 'assets/images/power1.png';
        case 'Denting And Painting':
          return 'assets/images/dentingNpainting1.png';
        case 'Tire':
          return 'assets/images/tireservices1.png';
        default:
          return 'assets/images/setting.png';
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: figmaSpaceToPercentageHeight(39, context),
                ),
                Row(
                  children: [
                    SizedBox(width: figmaSpaceToPercentageWidth(27, context)),
                    Container(
                      height: figmaSpaceToPercentageHeight(50, context),
                      width: figmaSpaceToPercentageWidth(55, context),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Colors.black,
                            size: figmaSpaceToPercentageHeight(30, context),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: figmaSpaceToPercentageHeight(30, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(30, context),
                    ),
                    Text(
                      '${widget.repairType} Service',
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentageHeight(22, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: figmaSpaceToPercentageHeight(2, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(30, context),
                    ),
                    Text(
                      "What are you looking for ?",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentageHeight(19, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
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
                    Flexible(
                      flex: 1,
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: figmaSpaceToPercentageHeight(21, context),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(25, context),
                    ),
                    Material(
                      child: Expanded(
                        child: Container(
                          width: figmaSpaceToPercentageWidth(373, context),
                          height: figmaSpaceToPercentageHeight(311, context),
                          padding: const EdgeInsets.only(left: 1),
                          margin: const EdgeInsets.only(left: 1),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(243, 243, 243, 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
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
                          child: Expanded(
                            child: SingleChildScrollView(
                              child: TextField(
                                controller: _descriptionController,
                                maxLines: null,
                                // Allow multiple lines of text
                                keyboardType: TextInputType.multiline,
                                // Allow multiline input
                                decoration: InputDecoration(
                                  hintText: "Describe your issue here",
                                  hintStyle: TextStyle(
                                    color:
                                        const Color.fromRGBO(50, 50, 50, 0.6),
                                    fontSize: figmaSpaceToPercentageHeight(
                                        17, context),
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
                                  fontSize:
                                      figmaSpaceToPercentageHeight(17, context),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: figmaSpaceToPercentageHeight(35, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(30, context),
                    ),
                    Text(
                      "Start Looking..",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentageHeight(21, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(160, context),
                    ),
                    Container(
                      height: figmaSpaceToPercentageHeight(60, context),
                      width: figmaSpaceToPercentageWidth(60, context),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: BorderRadius.all(Radius.circular(60 / 2)),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.search_sharp,
                            color: Colors.black,
                            size: 35,
                          ),
                          onPressed: () async {
                            // Navigator.of(context).pop();
                            final carUserInfo = context.read<UserCarsInfo>();
                            await carUserInfo.addOrderHistory(
                              ServiceHistory(
                                serviceType: widget.repairType,
                                serviceItem: widget.repairType,
                                serviceCost: 0,
                                partCost: 0,
                                serviceCenter: '',
                                serviceNote: _descriptionController.text,
                                serviceDate: carUserInfo.getBookingDate ??
                                    DateTime.now(),
                              ),
                            );
                          },
                        ),
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
                      width: figmaSpaceToPercentageWidth(73, context),
                    ),
                    Container(
                      width: figmaSpaceToPercentageWidth(159, context),
                      height: figmaSpaceToPercentageHeight(150, context),
                      padding: const EdgeInsets.only(left: 1),
                      margin: const EdgeInsets.only(left: 1),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 254, 0.9),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
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
                      child: Center(
                        child: Image.asset(
                          getImagePath(widget.repairType),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(15, context),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: figmaSpaceToPercentageHeight(100, context),
                        ),
                        Container(
                          width: figmaSpaceToPercentageWidth(111, context),
                          height: figmaSpaceToPercentageHeight(105, context),
                          padding: const EdgeInsets.only(left: 1),
                          margin: const EdgeInsets.only(left: 1),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.9),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
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
                          child: Center(
                            child: Image.asset(
                              getImagePath(widget.repairType),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
