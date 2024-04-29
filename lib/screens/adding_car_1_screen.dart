// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../models/adding_car_1.dart';
// import '../utils/image_constant.dart';
// import '../widgets/custom_app_bar.dart';
// import '../widgets/custom_drop_down.dart';
// import '../widgets/custom_text_form_field.dart';

// class AddingCar1Screen extends StatelessWidget {
//   const AddingCar1Screen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final padding = MediaQuery.of(context).padding;
//     final double screenHeight = height - padding.top - padding.bottom;

//     final addingCar1 = context.watch<AddingCar1>();

//     return Scaffold(
//       appBar: CustomAppBar(
//         centerTitle: true,
//         height: screenHeight * 0.2,
//         title: Image.asset(
//           ImageConstant.carcare1,
//           height: screenHeight * 0.05,
//         ),
//       ),
//       body: SafeArea(
//         child: SizedBox(
//           width: screenWidth,
//           child: SingleChildScrollView(
//             padding: EdgeInsets.only(top: screenHeight * 0.0611),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: screenWidth * 0.0611),
//                   child: Text(
//                     "manufacturer",
//                     style: Theme.of(context).textTheme.bodyMedium,
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.0091),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.0465,
//                       vertical: screenHeight * 0.0376),
//                   child: CustomTextFormField(
//                     controller: TextEditingController(),
//                     hintText: "audi",
//                     textInputAction: TextInputAction.done,
//                     alignment: Alignment.center,
//                     suffix: Padding(
//                       padding: EdgeInsets.fromLTRB(
//                         screenWidth * 0.0339,
//                         screenHeight * 0.0034,
//                         screenWidth * 0.0289,
//                         screenHeight * 0.0034,
//                       ),
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             ImageConstant.audiLogo,
//                             height: screenHeight * 0.0384,
//                             width: screenWidth * 0.0964,
//                           ),
//                           SvgPicture.asset(
//                             ImageConstant.arrowDown,
//                             height: screenHeight * 0.0104,
//                             width: screenWidth * 0.0229,
//                           ),
//                         ],
//                       ),
//                     ),
//                     suffixConstraints: BoxConstraints(
//                       maxHeight: screenHeight * 0.0452,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.0192),
//                 Padding(
//                   padding: EdgeInsets.only(left: screenWidth * 0.0611),
//                   child: Text(
//                     "car_model",
//                     style: Theme.of(context).textTheme.bodyMedium,
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.0034),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: screenWidth * 0.0465,
//                   ),
//                   child: CustomDropDown(
//                     hintText: "A8",
//                     alignment: Alignment.center,
//                     items: addingCar1.modelList,
//                     onChanged: (value) {},
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.0034),
//                 Padding(
//                   padding: EdgeInsets.only(left: screenWidth * 0.0611),
//                   child: Text(
//                     "msg_year_of_manufacture",
//                     style: Theme.of(context).textTheme.bodyMedium,
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.0034),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: screenWidth * 0.0465,
//                   ),
//                   child: CustomDropDown(
//                     width: screenWidth * 0.188,
//                     hintText: "2019",
//                     hintStyle: Theme.of(context).textTheme.titleSmall!,
//                     items: addingCar1.yearList,
//                     onChanged: (value) {},
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.0034),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.0905,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "msg_car_wraps_paint",
//                           textAlign: TextAlign.center,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium!
//                               .copyWith(fontFamily: 'Poppins'),
//                         ),
//                         Text(
//                           "upgrade",
//                           textAlign: TextAlign.center,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium!
//                               .copyWith(fontFamily: 'Poppins'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.0141),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../models/adding_car_1.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_app_bar.dart';
// import '../widgets/custom_drop_down.dart';
// import '../widgets/custom_text_form_field.dart';

class AddingCar1Screen extends StatelessWidget {
  const AddingCar1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final padding = MediaQuery.of(context).padding;
    final double screenHeight = height - padding.top - padding.bottom;

    // final addingCar1 = context.watch<AddingCar1>();

    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        height: screenHeight * 0.2,
        title: Image.asset(
          ImageConstant.carcare1,
          height: screenHeight * 0.05,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: screenHeight * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
