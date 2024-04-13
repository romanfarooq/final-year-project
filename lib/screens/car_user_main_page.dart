import 'package:flutter/material.dart';

import '../widgets/car_display.dart';
import '../models/car_info.dart';

class CarUserMain extends StatelessWidget {
  CarUserMain({super.key});

  final temp = UserCarsInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: temp.userCars
              .map((item) => CarDisplay(
                    name: item.name,
                    imgPath: item.imgPath,
                  ))
              .toList(),
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
