import 'package:flutter/material.dart';

double figmaSpaceToPercentageHeight(double figmaSpace, BuildContext context) {
  // Measure the height of the device screen
  double screenHeight = MediaQuery.of(context).size.height;

  // Calculate the percentage of the screen height occupied by the Figma space
  double spacePercentage = (figmaSpace / 932) * screenHeight;
  // Assuming Figma space is based on a 812px height design (iPhone X)

  // Return the calculated spacePercentage
  return spacePercentage;
}

// double figmaSpaceToPercentageWidth(double figmaSpace, BuildContext context) {
//   // Measure the width of the device screen
//   double screenWidth = MediaQuery.of(context).size.width;
//
//   // Calculate the percentage of the screen width occupied by the Figma space
//   double spacePercentageWidth = (figmaSpace / screenWidth) * 100;
//
//   // Calculate the equivalent space in Flutter using MediaQuery for width
//   return (MediaQuery.of(context).size.width * spacePercentageWidth) / 100;
// }

double figmaSpaceToPercentageWidth(double figmaSpace, BuildContext context) {
  // Measure the width of the device screen
  double screenWidth = MediaQuery.of(context).size.width;

  // Calculate the percentage of the screen width occupied by the Figma space
  double spacePercentageWidth = (figmaSpace / 430) * screenWidth;
  // Assuming Figma space is based on a 375px width design

  // Return the calculated spacePercentageWidth
  return spacePercentageWidth;
}
