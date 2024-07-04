import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../widgets/custom_positioned_container.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SearchField(),
            SizedBox(height: 10),
            FirstTwoRow(),
            ThirdRow(),
            SizedBox(height: 8),
            FourthRow(),
          ],
        ),
      ),
    );
  }
}

class ThirdRow extends StatelessWidget {
  const ThirdRow({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.bookingService);
              },
              child: Container(
                width: width * 0.42,
                height: height * 0.2,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/booking.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const Text(
              'Booking',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -1,
              ),
            )
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.tireRepair);
              },
              child: Container(
                width: width * 0.22,
                height: height * 0.2,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/rims.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const Text(
              'Rims',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -1,
              ),
            )
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.tireRepair);
              },
              child: Container(
                width: width * 0.22,
                height: height * 0.2,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/Tyres.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const Text(
              ' Tyres',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -1,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class FourthRow extends StatelessWidget {
  const FourthRow({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.dentingPaintingRepair,
                );
              },
              child: Container(
                width: width * 0.55,
                height: height * 0.2,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/paint.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const Text(
              'Car Wraps/ paint ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -1,
              ),
            )
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.dentingPaintingRepair,
                );
              },
              child: Container(
                width: width * 0.35,
                height: height * 0.2,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/denting.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const Text(
              'Denting',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -1,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class FirstTwoRow extends StatelessWidget {
  const FirstTwoRow({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height * 0.4,
      color: const Color.fromARGB(124, 255, 255, 255),
      child: Stack(
        children: [
          CustomPositionedContainer(
            left: width * 0.04,
            top: 0,
            width: width * 0.3,
            height: height * 0.15,
            imagePath: "assets/images/engineoil.png",
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.oilChange);
            },
          ),
          CustomPositionedContainer(
            left: width * 0.37,
            top: 0,
            width: width * 0.3,
            height: height * 0.15,
            imagePath: "assets/images/ElectricRepair.png",
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.electricalRepair);
            },
          ),
          CustomPositionedContainer(
            left: width * 0.04,
            top: height * 0.2,
            width: width * 0.63,
            height: height * 0.15,
            imagePath: "assets/images/MechanicalRepairs.png",
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.mechanicalRepair);
            },
          ),
          CustomPositionedContainer(
            left: width * 0.7,
            top: 0,
            width: width * 0.27,
            height: height * 0.35,
            imagePath: "assets/images/History.png",
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.serviceHistory);
            },
          ),
          Positioned(
            left: width * 0.1,
            top: height * 0.16,
            child: const Text(
              'Engine Oil',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -1,
              ),
            ),
          ),
          Positioned(
            left: width * 0.37,
            top: height * 0.16,
            child: const Text(
              'Electrical Repairs',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -1,
              ),
            ),
          ),
          Positioned(
            left: width * 0.76,
            top: height * 0.36,
            child: const Text(
              'History',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -1,
              ),
            ),
          ),
          Positioned(
            // Mechanical Repairs Text
            left: width * 0.18,
            top: height * 0.36,
            child: const Text(
              'Mechanical Repairs',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

AppBar appBar() {
  return AppBar(
    title: const Text(
      'Explore',
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
    actions: [
      Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 5,
        ),
        child: Container(
          alignment: Alignment.center,
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
      ),
    ],
  );
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(217, 217, 217, 0.5),
        borderRadius: BorderRadius.circular(48),
        shape: BoxShape.rectangle,
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
