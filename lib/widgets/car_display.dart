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
          image: AssetImage(imgPath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
