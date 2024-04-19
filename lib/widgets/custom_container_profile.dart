import 'package:flutter/material.dart';

class CustomRoundedContainer extends StatelessWidget {
  final double width;
  final String text;
  final double topRightRadius;
  final double topLeftRadius;

  const CustomRoundedContainer({
    super.key,
    required this.width,
    required this.text,
    this.topRightRadius = 100,
    this.topLeftRadius = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      alignment: Alignment.center,
      width: width,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: ShapeDecoration(
        color:const Color(0x7C4254A4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(100),
            bottomLeft: const Radius.circular(100),
            topRight: Radius.circular(topRightRadius),
            bottomRight: Radius.circular(topRightRadius),
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    );
  }
}
