import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:car_care/widgets/service_card.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';


class ServiceCardDetail extends StatefulWidget {
  final String text;
  final String categoryName;

  const ServiceCardDetail({Key? key, required this.text, required this.categoryName}) : super(key: key);

  @override
  _ServiceCardDetailState createState() => _ServiceCardDetailState();
}

class _ServiceCardDetailState extends State<ServiceCardDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: figmaSpaceToPercentage(55, context),
        ),

        Row(
          children: [
            SizedBox(
              width: figmaSpaceToPercentageWidth(162, context),
            ),
            Image.asset(
              ImageConstant.carcare1,
              height: 29,
              width: 106,
              alignment: Alignment.center,
            ),

            SizedBox(
              width: figmaSpaceToPercentageWidth(86, context),
            ),
            Container(
              width: figmaSpaceToPercentageWidth(60, context),
              height: figmaSpaceToPercentage(40, context),
              padding: const EdgeInsets.only(left: 1),
              margin: const EdgeInsets.only(left: 1),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 217, 217, 1),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: Image.asset(
                ImageConstant.Actions,
                height: figmaSpaceToPercentage(20, context),
                width: figmaSpaceToPercentageWidth(20, context),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),



        SizedBox(
          height: figmaSpaceToPercentage(55, context),
        ),

        Row(
          children: [
            SizedBox(
              width: figmaSpaceToPercentageWidth(33, context),
            ),
            Text(
              '${widget.categoryName} Service',
              style: TextStyle(
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontSize: figmaSpaceToPercentage(21, context),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none
              ),
            ),
          ],
        ),


            SizedBox(
            height: figmaSpaceToPercentage(24, context),),
    Row(
    children: [
    SizedBox(
    width: figmaSpaceToPercentageWidth(68, context),
    ),

     Expanded(
       child: Material(
         child: InkWell(
           onTap: (){
             Navigator.of(context).pop();
           },
          child: Container(
          width: double.infinity,
          height: figmaSpaceToPercentage(49, context),
          padding: const EdgeInsets.only(left: 1),
          margin: const EdgeInsets.only(left: 1),
          decoration: BoxDecoration(
          color: const Color.fromRGBO(217, 217, 217, 1),
          borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          ),
          boxShadow: [
          BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
          inset: true,
          offset: const Offset(-1, 4),
          ),
          ],
          ),
          child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
          padding: EdgeInsets.only(left: figmaSpaceToPercentage(21, context)),
          child: Text(
            '${widget.text}',
          style: TextStyle(
          color: const Color.fromRGBO(0, 0, 0, 1),
          fontSize: figmaSpaceToPercentage(17, context),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          ),
          ),
          ),
          ),
          ),
             ),
       ),
     ),
    ],
    ),
           SizedBox(
             height: figmaSpaceToPercentage(35, context),
           ),














      ],);
  }
}
       // title: Text(widget.categoryName), // Show category name in app bar

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('Detail for: ${widget.text}', style: TextStyle(fontSize: 24)),
      //       Text('Category: ${widget.categoryName}', style: TextStyle(fontSize: 20, color: Colors.grey)),

