import 'package:flutter/material.dart';

class CarDisplay extends StatelessWidget {
  const CarDisplay({
    super.key,
    required this.name,
    required this.imgPath,
  });

  final String name;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 290,
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
        image: DecorationImage(
          image: Image.network(imgPath).image,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                height: 21,
                decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.800000011920929),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
