import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/car_info.dart';
import '../routes/app_routes.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../utils/toast_message.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  Future<void> _uploadPicture(UserCarsInfo userInfo) async {
    try {
      final licensePlate = userInfo.getSelectedCarLicensePlate;
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        ToastMessage().toastmessage('No image selected');
        return;
      }

      final file = File(pickedFile.path);

      final metaData = SettableMetadata(contentType: 'image/jpeg');

      final storageRef = FirebaseStorage.instance.ref().child(
            'car_images/$licensePlate',
          );

      // Upload the file
      final snapshot = await storageRef.putFile(file, metaData);

      // Get the download URL
      final downloadUrl = await snapshot.ref.getDownloadURL();

      // Update Firestore with the new image URL
      await userInfo.updateCarImgPath(licensePlate, downloadUrl);

      ToastMessage().toastmessage('Image uploaded successfully');
    } catch (error) {
      ToastMessage().toastmessage('Failed to upload image: $error');
    }
  }

  void _deleteCar(BuildContext context, UserCarsInfo userInfo) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text(
            'Delete Car',
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none),
          ),
          content: const Text(
            'Are you sure you want to delete this car?',
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.none,
            ),
          ),
          insetPadding: EdgeInsets.symmetric(
            horizontal: figmaSpaceToPercentageWidth(20, context),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  // color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await userInfo.deleteCar(userInfo.getSelectedCarLicensePlate);
                if (context.mounted) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.bottomTab,
                    (route) => false,
                  );
                }
              },
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Color.fromARGB(255, 202, 56, 45),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserCarsInfo>();
    final car = userInfo.getSelectedCar;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
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
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.accountSettings,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: figmaSpaceToPercentage(350, context),
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          figmaSpaceToPercentage(30, context),
                        ),
                        topLeft: Radius.circular(
                          figmaSpaceToPercentage(30, context),
                        ),
                      ),
                      child: Image.network(
                        car.imgPath,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: figmaSpaceToPercentage(
                300,
                context,
              ), // This value should be less than the height of the first container to overlap
              left: 0,
              right: 0,
              child: Container(
                height: figmaSpaceToPercentage(510, context),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(243, 243, 243, 1),
                  borderRadius: BorderRadius.circular(
                    35,
                  ), // Set border radius for rounded corners
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: figmaSpaceToPercentage(30, context),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(33, context),
                        ),
                        Text(
                          car.model,
                          style: TextStyle(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: figmaSpaceToPercentage(24, context),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: figmaSpaceToPercentage(30, context),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(33, context),
                        ),
                        Container(
                          height: figmaSpaceToPercentage(142, context),
                          width: figmaSpaceToPercentageWidth(118, context),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(
                              20,
                            ), // Set border radius for rounded corners
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: figmaSpaceToPercentage(5, context),
                              ),
                              Image.asset(
                                ImageConstant.carwheel,
                                height: figmaSpaceToPercentage(70, context),
                                width:
                                    figmaSpaceToPercentageWidth(100, context),
                                alignment: Alignment.center,
                              ),
                              SizedBox(
                                height: figmaSpaceToPercentage(0.1, context),
                              ),
                              Text(
                                NumberFormat.decimalPattern().format(
                                  car.distanceTravelled,
                                ),
                                style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize:
                                        figmaSpaceToPercentage(19, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                'KM Driven',
                                style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize:
                                        figmaSpaceToPercentage(14, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(10, context),
                        ),
                        Container(
                          height: figmaSpaceToPercentage(142, context),
                          width: figmaSpaceToPercentageWidth(118, context),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(
                              20,
                            ), // Set border radius for rounded corners
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: figmaSpaceToPercentage(5, context),
                              ),
                              Image.asset(
                                ImageConstant.oilchange,
                                height: figmaSpaceToPercentage(70, context),
                                width:
                                    figmaSpaceToPercentageWidth(100, context),
                                alignment: Alignment.center,
                              ),
                              SizedBox(
                                height: figmaSpaceToPercentage(0.1, context),
                              ),
                              Text(
                                NumberFormat.decimalPattern().format(
                                  car.lastOilChangeDistance,
                                ),
                                style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize:
                                        figmaSpaceToPercentage(19, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                'Last Oil Change',
                                style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize:
                                        figmaSpaceToPercentage(13, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(10, context),
                        ),
                        Container(
                          height: figmaSpaceToPercentage(142, context),
                          width: figmaSpaceToPercentageWidth(118, context),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(
                              20,
                            ), // Set border radius for rounded corners
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: figmaSpaceToPercentage(5, context),
                              ),
                              Image.asset(
                                ImageConstant.caruser,
                                height: figmaSpaceToPercentage(70, context),
                                width:
                                    figmaSpaceToPercentageWidth(100, context),
                                alignment: Alignment.center,
                              ),
                              SizedBox(
                                height: figmaSpaceToPercentage(0.1, context),
                              ),
                              Text(
                                car.year.toString(),
                                style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize:
                                        figmaSpaceToPercentage(19, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                'Year',
                                style: TextStyle(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize:
                                        figmaSpaceToPercentage(13, context),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: figmaSpaceToPercentage(45, context),
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.serviceHistory,
                          );
                        },
                        child: Container(
                          height: figmaSpaceToPercentage(60, context),
                          width: figmaSpaceToPercentageWidth(368, context),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(
                              38,
                            ), // Set border radius for rounded corners
                          ),
                          child: Center(
                            child: Text(
                              'Service History',
                              style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: figmaSpaceToPercentage(23, context),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: figmaSpaceToPercentage(18, context),
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.bookingService,
                          );
                        },
                        child: Container(
                          height: figmaSpaceToPercentage(60, context),
                          width: figmaSpaceToPercentageWidth(368, context),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(
                              38,
                            ), // Set border radius for rounded corners
                          ),
                          child: Center(
                            child: Text(
                              'Book A Service',
                              style: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: figmaSpaceToPercentage(23, context),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: figmaSpaceToPercentage(18, context),
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          _deleteCar(context, userInfo);
                        },
                        child: Container(
                          height: figmaSpaceToPercentage(60, context),
                          width: figmaSpaceToPercentageWidth(368, context),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 208, 50, 50),
                            borderRadius: BorderRadius.circular(
                              38,
                            ), // Set border radius for rounded corners
                          ),
                          child: Center(
                            child: Text(
                              'Delete Car',
                              style: TextStyle(
                                  color: const Color.fromRGBO(217, 217, 217, 1),
                                  fontSize: figmaSpaceToPercentage(23, context),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: figmaSpaceToPercentage(
                230,
                context,
              ), // 250 (top of container 2) - 30 pixels
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: figmaSpaceToPercentageWidth(33, context),
                    ),
                    child: Text(
                      userInfo.getName ?? '',
                      style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: figmaSpaceToPercentage(25, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: figmaSpaceToPercentageWidth(33, context),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          _uploadPicture(userInfo);
                        },
                        child: Container(
                          height: figmaSpaceToPercentage(52, context),
                          width: figmaSpaceToPercentageWidth(52, context),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(217, 217, 217, 1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.file_upload_rounded,
                            color: Colors.black,
                            size: figmaSpaceToPercentage(40, context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
