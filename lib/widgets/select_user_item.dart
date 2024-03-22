import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../utils/image_constant.dart';

class SelectUserItem extends StatelessWidget {
  const SelectUserItem({
    super.key,
    required this.userType,
    required this.offset,
    required this.onTap,
    required this.screenWidth,
    required this.screenHeight,
    required this.quarterTurns,
  });

  final String userType;
  final Offset offset;
  final int quarterTurns;
  final VoidCallback onTap;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: _alignment,
      margin: _margin,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(236, 236, 236, 0.77),
        borderRadius: _borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            inset: true,
            offset: offset,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.05,
            bottom: screenHeight * 0.05,
          ),
          child: Row(
            children: [
              if (userType == 'Car Owner') ..._buildCarOwner,
              Padding(
                padding: _padding,
                child: RotatedBox(
                  quarterTurns: quarterTurns,
                  child: Text(
                    userType.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              if (userType == 'Workshop') ..._buildWorkshop,
            ],
          ),
        ),
      ),
    );
  }

  EdgeInsetsGeometry get _margin {
    if (userType == 'Car Owner') {
      return EdgeInsets.only(right: screenWidth * 0.25);
    } else if (userType == 'Workshop') {
      return EdgeInsets.only(left: screenWidth * 0.25);
    }
    return EdgeInsets.zero;
  }

  AlignmentGeometry get _alignment {
    if (userType == 'Car Owner') {
      return Alignment.topLeft;
    } else if (userType == 'Workshop') {
      return Alignment.bottomRight;
    }
    return Alignment.center;
  }

  BorderRadiusGeometry get _borderRadius {
    if (userType == 'Car Owner') {
      return const BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
      );
    } else if (userType == 'Workshop') {
      return const BorderRadius.only(
        topLeft: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      );
    }
    return BorderRadius.zero;
  }

  EdgeInsetsGeometry get _padding {
    if (userType == 'Car Owner') {
      return EdgeInsets.only(right: screenWidth * 0.1);
    } else if (userType == 'Workshop') {
      return EdgeInsets.only(left: screenWidth * 0.1);
    }
    return EdgeInsets.zero;
  }

  List<Widget> get _buildCarOwner {
    return [
      Image.asset(
        ImageConstant.carOnwer,
        height: screenHeight * 0.2,
      ),
      const Spacer(),
    ];
  }

  List<Widget> get _buildWorkshop {
    return [
      const Spacer(),
      Image.asset(
        ImageConstant.workshop,
        height: screenHeight * 0.2,
      ),
    ];
  }
}
