import 'package:flutter/material.dart';
double figmaSpaceToPercentage(double figmaSpace, BuildContext context) {
  // Measure the height of the device screen
  double screenHeight = MediaQuery.of(context).size.height;

  // Calculate the percentage of the screen height occupied by the Figma space
  double spacePercentage = (figmaSpace / screenHeight) * 100;

  // Calculate the equivalent space in Flutter using MediaQuery
  return (MediaQuery.of(context).size.height * spacePercentage) / 100;
}