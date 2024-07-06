import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/car_info.dart';
import '../routes/app_routes.dart';
import '../utils/image_constant.dart';
import '../widgets/car_display.dart';
import '../widgets/google_map_display.dart';
import '../widgets/graph_km_driven.dart';
import '../widgets/text_container_carusermain.dart';

class CarUserMain extends StatelessWidget {

  const CarUserMain({super.key});
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

    return Scaffold(
      appBar: appBar(context),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CarDetailes(),
            TextContainer(text: 'Map'),
            SizedBox(height: 10),
            GoogleMapDisplay(),
            SizedBox(height: 20),
            EmergencyRoadsideAssistanceTextDisply(),
            SizedBox(height: 10),
            EmergencyRoadsideAssistanceButton(),

            ///KM DRIVEN
            SizedBox(height: 10),
            TextContainer(text: 'KM Driven'),
            LineChartCard(),
            SizedBox(height: 10),

            ///OIL CHANGE
            SizedBox(height: 10),
            TextContainer(text: 'Oil Change'),
            SizedBox(height: 10),
            OilChangeKM(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
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
              margin: const EdgeInsets.only(
                right: 10,
                top: 5,
                left: 5,
              ),
              width: 60,
              height: 38,
              child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async{
                    await _logout(context);
                    if (context.mounted) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.selectUserScreen,
                            (route) => false,
                      );

                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class OilChangeKM extends StatelessWidget {
  const OilChangeKM({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          left: 45,
        ),
        width: 385,
        height: 116,
        decoration: const ShapeDecoration(
          color: Color(0xFFF2F2F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(21),
              bottomLeft: Radius.circular(21),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 25,
              ),
              child: const SizedBox(
                width: 125,
                height: 118,
                child: Text(
                  '450',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 43,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: -1,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 15,
              ),
              alignment: Alignment.centerLeft,
              child: const SizedBox(
                width: 40,
                height: 114,
                child: Text(
                  'KM',
                  textAlign: TextAlign.center,
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
            ),
            const VerticalDivider(
              color: Colors.black,
              thickness: 2,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 75,
              ),
              child: const SizedBox(
                width: 122,
                height: 36,
                child: Text(
                  'Last : 2575 km ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: -1,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class EmergencyRoadsideAssistanceButton extends StatelessWidget {
  const EmergencyRoadsideAssistanceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(
          255,
          243,
          243,
          243,
        ), // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48), // Rounded corners
        ),
        fixedSize: const Size(146, 98), // Button size
      ),
      onPressed: () {
        // Define the action when the button is pressed
        //print('Wifi Tethering Button Pressed');
      },
      child: const Icon(
        Icons.wifi_tethering, // Wifi tethering icon
        size: 65, // Icon size
        color: Colors.black,
      ),
    );
  }
}

class EmergencyRoadsideAssistanceTextDisply extends StatelessWidget {
  const EmergencyRoadsideAssistanceTextDisply({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Emergency Roadside Assistance',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        height: 0,
        letterSpacing: -1,
      ),
    );
  }
}

class CarDetailes extends StatelessWidget {
  const CarDetailes({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: 200.0,
      child: const ListviewWidget(),
    );
  }
}

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final carinfo = context.read<UserCarsInfo>();
    final cars = carinfo.getCars;
    return ListView(
      scrollDirection: Axis.horizontal,
      children: cars.isEmpty
          ? const [CardSaketon()]
          : cars
              .map((item) => InkWell(
                    onTap: () {
                      carinfo.changeSelectedCar(item.licensePlate);
                      Navigator.of(context).pushNamed(AppRoutes.userHomeScreen);
                    },
                    child: CarDisplay(
                      name: item.manufacturer,
                      imgPath: item.imgPath,
                    ),
                  ))
              .toList(),
    );
  }
}

class CardSaketon extends StatelessWidget {
  const CardSaketon({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 290,
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.no_accounts,
            size: 50,
            color: Colors.black,
          ),
          Text(
            'No Cars Added',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: -1,
            ),
          ),
        ],
      ),
    );
  }
}
