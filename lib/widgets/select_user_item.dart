import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../utils/image_constant.dart';

class SelectUserItem extends StatelessWidget {
  const SelectUserItem({
    super.key,
    required this.userType,
    required this.offset,
    required this.onTap,
    required this.quarterTurns,
    required this.imageHeight,
    required this.alignment,
    required this.margin,
    required this.textPadding,
    required this.inkWellPadding,
    required this.borderRadius,
  });

  final String userType;
  final Offset offset;
  final int quarterTurns;
  final VoidCallback onTap;
  final double imageHeight;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry textPadding;
  final EdgeInsetsGeometry inkWellPadding;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: margin,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(236, 236, 236, 0.77),
        borderRadius: borderRadius,
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
          padding: inkWellPadding,
          child: Row(
            children: [
              if (userType == 'Car Owner') ..._buildCarOwnerIcon,
              Padding(
                padding: textPadding,
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
              if (userType == 'Workshop') ..._buildWorkshopIcon,
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get _buildCarOwnerIcon {
    return [
      Image.asset(
        ImageConstant.carOnwer,
        height: imageHeight,
      ),
      const Spacer(),
    ];
  }

  List<Widget> get _buildWorkshopIcon {
    return [
      const Spacer(),
      Image.asset(
        ImageConstant.workshop,
        height: imageHeight,
      ),
    ];
  }
}
