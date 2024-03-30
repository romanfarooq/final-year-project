import 'package:flutter/material.dart';
double figmaSpaceToPercentage(double figmaSpace, BuildContext context) {
  // Measure the height of the device screen
  double screenHeight = MediaQuery.of(context).size.height;

  // Calculate the percentage of the screen height occupied by the Figma space
  double spacePercentage = (figmaSpace / screenHeight) * 100;

  // Calculate the equivalent space in Flutter using MediaQuery
  return (MediaQuery.of(context).size.height * spacePercentage) / 100;
}

double figmaSpaceToPercentageWidth(double figmaSpace, BuildContext context) {
  // Measure the width of the device screen
  double screenWidth = MediaQuery.of(context).size.width;

  // Calculate the percentage of the screen width occupied by the Figma space
  double spacePercentageWidth = (figmaSpace / screenWidth) * 100;

  // Calculate the equivalent space in Flutter using MediaQuery for width
  return (MediaQuery.of(context).size.width * spacePercentageWidth) / 100;
}