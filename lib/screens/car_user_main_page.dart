import 'package:car_care/widgets/graph_km_driven.dart';
import 'package:car_care/widgets/text_container_carusermain.dart';
import 'package:flutter/material.dart';
//import 'package:car_care/widgets/stateful/bottom_tabs.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/car_display.dart';
import '../models/car_info.dart';


LatLng sampleLoc = const LatLng(31.4469, 74.2682);

class CarUserMain extends StatelessWidget {
  CarUserMain({super.key});
  final temp = UserCarsInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            car_detailes(temp: temp),
            const TextContainer(text: 'Map'),
            const SizedBox(height: 10),
            const googleMap(),
            const SizedBox(height: 10),
            const EmergencyRoadsideAssistanceTextDisply(),
            const SizedBox(height: 10),
            const EmergencyRoadsideAssistanceButton(),
            ///KM DRIVEN
            const SizedBox(height: 10),
            const TextContainer(text: 'KM Driven'),
            const LineChartCard(),
            const SizedBox(height: 10),

            ///OIL CHANGE
            const SizedBox(height: 10),
            const TextContainer(text: 'Oil Change'),
            const SizedBox(height: 10),
            const OilChangeKM(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      //bottomNavigationBar:const BottomTabs(),
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
                icon: const Icon(Icons.notifications),
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
  const EmergencyRoadsideAssistanceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color.fromARGB(255, 243, 243, 243), // Button color
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
  const EmergencyRoadsideAssistanceTextDisply({
    super.key,
  });

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

class googleMap extends StatelessWidget {
  const googleMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365,
      height: 210,
      decoration: ShapeDecoration(
        image: DecorationImage(
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

class car_detailes extends StatelessWidget {
  const car_detailes({
    super.key,
    required this.temp,
  });

  final UserCarsInfo temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: Listview(temp: temp),
    );
  }
}

class Listview extends StatelessWidget {
  const Listview({
    super.key,
    required this.temp,
  });

  final UserCarsInfo temp;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: temp.userCars
          .map((item) => CarDisplay(
                name: item.name,
                imgPath: item.imgPath,
              ))
          .toList(),
    );
  }
}
