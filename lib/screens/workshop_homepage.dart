import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../models/workshop_info.dart';
import '../routes/app_routes.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../utils/toast_message.dart';

class WorkshopHomepage extends StatefulWidget {
  const WorkshopHomepage({super.key});

  @override
  State<WorkshopHomepage> createState() => _WorkshopHomepageState();
}

class _WorkshopHomepageState extends State<WorkshopHomepage> {
  double? _rating;

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      ToastMessage().toastmessage('Logged out');
    } catch (error) {
      ToastMessage().toastmessage('Error logging out: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final workshopInfo = context.read<WorkshopInfo>();
    _rating = workshopInfo.getRatingStars;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: figmaSpaceToPercentageHeight(55, context),
                ),
                Center(
                  child: Image.asset(
                    ImageConstant.carcare1,
                    height: 29,
                    width: 106,
                    alignment: Alignment.center,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(340, context),
                    ),
                    InkWell(
                      onTap: () async {
                        await _logout(context);
                        if (context.mounted) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.selectUserScreen,
                            (route) => false,
                          );
                        }
                      },
                      child: Container(
                          width: figmaSpaceToPercentageWidth(60, context),
                          height: figmaSpaceToPercentageHeight(40, context),
                          padding: const EdgeInsets.only(left: 1),
                          margin: const EdgeInsets.only(left: 1),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: const Icon(Icons.logout)),
                    ),
                  ],
                ),
                SizedBox(
                  height: figmaSpaceToPercentageHeight(6, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(45, context),
                    ),
                    Text(
                      workshopInfo.getWorkshopName,
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentageHeight(14, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: figmaSpaceToPercentageHeight(7, context),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(45, context),
                    ),
                    Text(
                      "Address:",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentageHeight(14, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(4, context),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.5,
                          ),
                          child: Text(
                            workshopInfo.getAddress,
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize:
                                  figmaSpaceToPercentageHeight(14, context),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: figmaSpaceToPercentageHeight(7, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(45, context),
                    ),
                    Text(
                      "Contact:",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentageHeight(14, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(4, context),
                    ),
                    Text(
                      workshopInfo.getPhone,
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentageHeight(14, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: figmaSpaceToPercentageHeight(4, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(45, context),
                    ),
                    Text(
                      "Opening Hours:",
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentageHeight(14, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(4, context),
                    ),
                    Text(
                      workshopInfo.getOpeningHours,
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentageHeight(14, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: figmaSpaceToPercentageHeight(5, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(45, context),
                    ),
                    RatingBar.builder(
                      initialRating: _rating!,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: figmaSpaceToPercentageHeight(20, context),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                      },
                      glowColor: Colors.amber, // Specify the glow color here
                    ),
                  ],
                ),
                SizedBox(
                  height: figmaSpaceToPercentageHeight(15, context),
                ),
                Row(children: [
                  SizedBox(
                    width: figmaSpaceToPercentageWidth(45, context),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.vehicleServiceRecordRepaired,
                        );
                      },
                      child: Container(
                        width: figmaSpaceToPercentageWidth(121, context),
                        height: figmaSpaceToPercentageHeight(40, context),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "History",
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize:
                                  figmaSpaceToPercentageHeight(18, context),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: figmaSpaceToPercentageHeight(20, context),
                ),
                Center(
                  child: Text(
                    "SERVICES",
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentageHeight(18, context),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentageHeight(10, context),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(45, context),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.electricalServicesVault,
                        );
                      },
                      child: Container(
                        width: figmaSpaceToPercentageWidth(159, context),
                        height: figmaSpaceToPercentageHeight(150, context),
                        padding: const EdgeInsets.only(left: 1),
                        margin: const EdgeInsets.only(left: 1),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(236, 236, 236, 0.77),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 5,
                              inset: true,
                              offset: const Offset(1, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          ImageConstant.electricalrepairs,
                          height: figmaSpaceToPercentageHeight(150, context),
                          width: figmaSpaceToPercentageWidth(159, context),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(20, context),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.mechanicalServicesVault,
                        );
                      },
                      child: Container(
                        width: figmaSpaceToPercentageWidth(159, context),
                        height: figmaSpaceToPercentageHeight(150, context),
                        padding: const EdgeInsets.only(left: 1),
                        margin: const EdgeInsets.only(left: 1),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(236, 236, 236, 0.77),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 5,
                              inset: true,
                              offset: const Offset(1, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          ImageConstant.mechanical,
                          height: figmaSpaceToPercentageHeight(150, context),
                          width: figmaSpaceToPercentageWidth(159, context),
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
                      width: figmaSpaceToPercentageWidth(45, context),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.dentingPaintingServicesVault,
                        );
                      },
                      child: Container(
                        width: figmaSpaceToPercentageWidth(159, context),
                        height: figmaSpaceToPercentageHeight(150, context),
                        padding: const EdgeInsets.only(left: 1),
                        margin: const EdgeInsets.only(left: 1),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(236, 236, 236, 0.77),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 5,
                              inset: true,
                              offset: const Offset(1, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          ImageConstant.dentingNpainting,
                          height: figmaSpaceToPercentageHeight(150, context),
                          width: figmaSpaceToPercentageWidth(159, context),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: figmaSpaceToPercentageWidth(20, context),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.tireServicesVault,
                        );
                      },
                      child: Container(
                        width: figmaSpaceToPercentageWidth(159, context),
                        height: figmaSpaceToPercentageHeight(150, context),
                        padding: const EdgeInsets.only(left: 1),
                        margin: const EdgeInsets.only(left: 1),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(236, 236, 236, 0.77),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 5,
                              inset: true,
                              offset: const Offset(1, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          ImageConstant.tireservices,
                          height: figmaSpaceToPercentageHeight(150, context),
                          width: figmaSpaceToPercentageWidth(159, context),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                ImageConstant.wrenchtool,
                height: figmaSpaceToPercentageHeight(240, context),
                width: figmaSpaceToPercentageWidth(300, context),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
