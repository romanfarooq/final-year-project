import 'package:flutter/material.dart';

class CustomPositionedContainer extends StatelessWidget {
  final double left;
  final double top;
  final double width;
  final double height;
  final String imagePath;

  const CustomPositionedContainer({
    super.key,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
