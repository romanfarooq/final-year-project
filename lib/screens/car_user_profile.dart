//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:car_care/widgets/service_history.dart';
import 'package:car_care/widgets/custom_container_profile.dart';
import '../data/service_history_data.dart';

class CarOwnerProfile extends StatelessWidget {
  const CarOwnerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: 
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: const Text(
                'ALI USMAN',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: first_row(),
            ),
            //2nd row
            const SizedBox(
              height: 10,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: secound_row(),
              //3rd row
            ),
            const SizedBox(
              height: 10,
            ),
            const third_row(),
            const driven_con(),
            km_con(),
            const SizedBox(
              height: 10,
            ),
            service_history_con(context),
            const SizedBox(
              height: 10,
            ),
            ...service_history_data.map((widgetFactory) => widgetFactory),
          ],
        ),
      ),
    );
  }

  Container service_history_con(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: const BoxDecoration(
        color: Color(0x7CCAB600),
      ),
      alignment: Alignment.centerLeft,
      child: const Text(
        'Service History',
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontFamily: 'poppins',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
    );
  }

  Container km_con() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      child: const Text(
        '15265211 km',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Popins',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
    );
  }

  AppBar appbar() {
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
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class driven_con extends StatelessWidget {
  const driven_con({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: const Text(
        'Driven:',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'poppins',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    );
  }
}

class third_row extends StatelessWidget {
  const third_row({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomRoundedContainer(
          width: MediaQuery.of(context).size.width * 0.95,
          text: "Gasoline",
          topRightRadius: 0,
          topLeftRadius: 0, // Default value is 100
        ),
      ],
    );
  }
}

class secound_row extends StatelessWidget {
  const secound_row({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomRoundedContainer(
          width: MediaQuery.of(context).size.width * 0.4,
          text: "LEV-8852",
          topRightRadius: 100,
          topLeftRadius: 100, // Default value is 100
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'YEAR',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        CustomRoundedContainer(
          width: MediaQuery.of(context).size.width * 0.52,
          text: "2012",
          topRightRadius: 0,
          topLeftRadius: 0, // Default value is 100
        ),
      ],
    );
  }
}

class first_row extends StatelessWidget {
  const first_row({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRoundedContainer(
          width: MediaQuery.of(context).size.width * 0.3,
          text: "Audi",
          topRightRadius: 100,
          topLeftRadius: 100, // Default value is 100
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'VIN',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        CustomRoundedContainer(
          width: MediaQuery.of(context).size.width * 0.52,
          text: "4Y1SL65848Z411439",
          topRightRadius: 0,
          topLeftRadius: 0, // Default value is 100
        ),
      ],
    );
  }
}
