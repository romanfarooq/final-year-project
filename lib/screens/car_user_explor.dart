import 'package:car_care/widgets/custom_positioned_container.dart';
import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _searchField(),
            const SizedBox(
              height: 10,
            ),
            const FirstTwoRow(),
            thirrdRow(),
            const SizedBox(
              height: 8,
            ),
            const FourthRow(),
          ],
        ),
      ),
    );
  }

  Row thirrdRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              width: 150,
              height: 150,
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
            Container(
              width: 80,
              height: 150,
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
            Container(
              width: 80,
              height: 150,
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
  const FourthRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              width: 205,
              height: 150,
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
            Container(
              width: 150,
              height: 150,
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
  const FirstTwoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.355,
      color: const Color.fromARGB(124, 255, 255, 255),
      child: Stack(
        children: [
          CustomPositionedContainer(
            left: MediaQuery.of(context).size.width * 0.05,
            top: 0,
            width: 115,
            height: 115,
            imagePath: "assets/images/EngineOil.png",
          ),
          const CustomPositionedContainer(
            left: 153,
            top: 0,
            width: 115,
            height: 115,
            imagePath: "assets/images/ElectricRepair.png",
          ),
          CustomPositionedContainer(
            left: MediaQuery.of(context).size.width * 0.05,
            top: 146,
            width: 248,
            height: 115,
            imagePath: "assets/images/MechanicalRepairs.png",
          ),
          const CustomPositionedContainer(
            left: 280,
            top: 0,
            width: 114,
            height: 260,
            imagePath: "assets/images/History.png",
          ),
          const Positioned(
            // Engine Oil Text
            left: 19,
            top: 118,
            child: SizedBox(
              width: 125,
              height: 34,
              child: Text(
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
          ),
          const Positioned(
            // Electrical Repairs Text
            left: 150,
            top: 118,
            child: SizedBox(
              width: 124,
              height: 34,
              child: Text(
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
          ),
          const Positioned(
            // History Text
            left: 270,
            top: 270,
            child: SizedBox(
              width: 140,
              height: 114,
              child: Text(
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
          ),
          const Positioned(
            // Mechanical Repairs Text
            left: 30,
            top: 270,
            child: SizedBox(
              width: 239,
              height: 114,
              child: Text(
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
          ),
        ],
      ),
    );
  }
}

////
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

Container _searchField() {
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
