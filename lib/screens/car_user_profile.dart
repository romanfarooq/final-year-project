import 'package:flutter/material.dart';

import '../data/service_history_data.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_container_profile.dart';

class CarOwnerProfile extends StatelessWidget {
  const CarOwnerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
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
              child: FirstRow(),
            ),
            //2nd row
            const SizedBox(
              height: 10,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SecondRow(),
              //3rd row
            ),
            const SizedBox(
              height: 10,
            ),
            const ThirdRow(),
            const DrivenCon(),
            kmCon(),
            const SizedBox(
              height: 10,
            ),
            serviceHistoryCon(context),
            const SizedBox(
              height: 10,
            ),
            ...serviceHistoryData.map((widgetFactory) => widgetFactory),
          ],
        ),
      ),
    );
  }

  Container serviceHistoryCon(BuildContext context) {
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

  Container kmCon() {
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DrivenCon extends StatelessWidget {
  const DrivenCon({super.key});

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

class ThirdRow extends StatelessWidget {
  const ThirdRow({super.key});

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

class SecondRow extends StatelessWidget {
  const SecondRow({super.key});

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

class FirstRow extends StatelessWidget {
  const FirstRow({super.key});

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
