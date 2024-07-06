import 'package:car_care/utils/fetch_distance.dart';
import 'package:car_care/utils/toast_message.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/workshop_info.dart';
import '../models/bidding_info.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';

import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';

class CustomServiceWidget extends StatefulWidget {
  final String userId;
  final String carName;
  final String ownerName;
  final String carModel;
  final String issueType;
  final String issueDescription;
  final VoidCallback onDismiss;
  final LatLng userLocation;

  const CustomServiceWidget({
    super.key,
    required this.userId,
    required this.carName,
    required this.ownerName,
    required this.carModel,
    required this.issueType,
    required this.issueDescription,
    required this.onDismiss,
    required this.userLocation,
  });

  @override
  State<CustomServiceWidget> createState() => _CustomServiceWidgetState();
}

class _CustomServiceWidgetState extends State<CustomServiceWidget> {
  Color _backgroundColor = const Color.fromRGBO(217, 217, 217, 1);
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _priceController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final workshop = context.read<WorkshopInfo>();
    final biddingInfo = context.read<BiddingInfo>();
    return Material(
      child: InkWell(
        onTap: () {
          setState(() {
            // Toggle background color between white and red
            _backgroundColor =
                _backgroundColor == const Color.fromRGBO(217, 217, 217, 1)
                    ? const Color.fromRGBO(255, 191, 66, 1)
                    : const Color.fromRGBO(217, 217, 217, 1);
          });
        },
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: figmaSpaceToPercentageWidth(42, context),
                ),
                Container(
                  width: figmaSpaceToPercentageWidth(353, context),
                  height: figmaSpaceToPercentageHeight(170, context),
                  padding: const EdgeInsets.only(left: 1),
                  margin: const EdgeInsets.only(left: 1),
                  decoration: BoxDecoration(
                    color: _backgroundColor,
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
                  child: Row(
                    children: [
                      SizedBox(
                        width: figmaSpaceToPercentageWidth(21, context),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: figmaSpaceToPercentageHeight(20, context),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${widget.carName} (${widget.issueType}):',
                                  style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: figmaSpaceToPercentageHeight(
                                        15, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      figmaSpaceToPercentageWidth(70, context),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {
                                      final price = double.tryParse(
                                          _priceController.text);
                                      if (price == null) {
                                        ToastMessage().toastmessage(
                                          'Please enter a valid price',
                                        );
                                        return;
                                      }

                                      final bidding = Bidding(
                                        serviceCenterId: workshop.uid!,
                                        serviceCost: price,
                                        partCost: 0,
                                        serviceCenter: workshop.workshopName!,
                                        isAccepted: false,
                                        serviceLocation: workshop.location!,
                                      );

                                      await biddingInfo.addBidding(
                                        bidding,
                                        widget.userId,
                                        workshop.uid!,
                                      );

                                      widget.onDismiss();
                                    },
                                    child: Container(
                                      width: figmaSpaceToPercentageWidth(
                                          44, context),
                                      height: figmaSpaceToPercentageHeight(
                                          26, context),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                        color: Color.fromRGBO(
                                          255,
                                          255,
                                          255,
                                          1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          ImageConstant.actions,
                                          height: figmaSpaceToPercentageHeight(
                                              20, context),
                                          width: figmaSpaceToPercentageWidth(
                                              20, context),
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      figmaSpaceToPercentageWidth(5, context),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: widget.onDismiss,
                                    child: Container(
                                      width: figmaSpaceToPercentageWidth(
                                          44, context),
                                      height: figmaSpaceToPercentageHeight(
                                          26, context),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                        color: Color.fromRGBO(255, 0, 0, 1),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          ImageConstant.cross,
                                          height: figmaSpaceToPercentageHeight(
                                              20, context),
                                          width: figmaSpaceToPercentageWidth(
                                              20, context),
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: figmaSpaceToPercentageHeight(1, context),
                            ),
                            Text(
                              widget.ownerName,
                              style: TextStyle(
                                color: const Color.fromRGBO(0, 0, 0, 1),
                                fontSize:
                                    figmaSpaceToPercentageHeight(12, context),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(
                              height: figmaSpaceToPercentageHeight(1, context),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Car Model:',
                                  style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: figmaSpaceToPercentageHeight(
                                        12, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      figmaSpaceToPercentageWidth(2, context),
                                ),
                                Text(
                                  widget.carModel,
                                  style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: figmaSpaceToPercentageHeight(
                                        12, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: figmaSpaceToPercentageHeight(1, context),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Issue:',
                                  style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: figmaSpaceToPercentageHeight(
                                        12, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      figmaSpaceToPercentageWidth(2, context),
                                ),
                                Flexible(
                                  child: Text(
                                    widget.issueDescription,
                                    style: TextStyle(
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: figmaSpaceToPercentageHeight(
                                          12, context),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: figmaSpaceToPercentageHeight(10, context),
                            ),
                            SizedBox(
                              height: figmaSpaceToPercentageHeight(30, context),
                              width: figmaSpaceToPercentageWidth(180, context),
                              child: TextField(
                                controller: _priceController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter Your Price',
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: figmaSpaceToPercentageHeight(18, context),
            ),
          ],
        ),
      ),
    );
  }
}
