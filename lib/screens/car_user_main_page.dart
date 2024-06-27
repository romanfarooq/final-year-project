import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../models/car_info.dart';
import '../widgets/car_display.dart';
import '../widgets/graph_km_driven.dart';
import '../widgets/text_container_carusermain.dart';

LatLng sampleLoc = const LatLng(31.4469, 74.2682);

class CarUserMain extends StatelessWidget {
  const CarUserMain({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CarDetailes(),
            TextContainer(text: 'Map'),
            SizedBox(height: 10),
            GoogleMap(),
            SizedBox(height: 10),
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

  AppBar appBar() {
    return AppBar(
      title: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(10),
        child: Image.asset('assets/images/carcare_1.png', height: 25),
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
}

class OilChangeKM extends StatelessWidget {
  const OilChangeKM({
    super.key,
  });

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

class GoogleMap extends StatelessWidget {
  const GoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365,
      height: 210,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/map.png'),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
    //child: GoogleMap(
    //     initialCameraPosition:CameraPosition(target: sampleLoc, zoom: 15.0) ,
    // )
  }
}

class CarDetailes extends StatelessWidget {
  const CarDetailes({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: const ListviewWiget(),
    );
  }
}

class ListviewWiget extends StatelessWidget {
  const ListviewWiget({super.key});
  @override
  Widget build(BuildContext context) {
    final carinfo = context.read<UserCarsInfo>();
    return ListView(
      scrollDirection: Axis.horizontal,
      children: carinfo.getCars
          .map((item) => CarDisplay(
                name: item.manufacture,
                imgPath: item.imgPath,
              ))
          .toList(),
    );
  }
}
