// import 'package:flutter/material.dart';
// import 'package:carcare/models/car_models.dart';

// class CarUserMain extends StatelessWidget {
//   const CarUserMain({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:  Container(
//           alignment: Alignment.centerLeft,
//           child: Image.asset('assets/images/carcare_1.png', height: 25),
//           margin: EdgeInsets.all(10),
//         ),
//         actions: [
//           Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(217, 217, 217, 0.5),
//                   borderRadius: BorderRadius.circular(48),
//                   shape: BoxShape.rectangle,
//                 ),
//                 margin: EdgeInsets.only(right: 5, top: 5,left: 10),
//                 width: 60,
//                 height: 38,
//                 child: IconButton(
//                   icon: Icon(Icons.notifications),
//                   onPressed: () {},
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(217, 217, 217, 0.5),
//                   borderRadius: BorderRadius.circular(48),
//                   shape: BoxShape.rectangle,
//                 ),
//                 margin: EdgeInsets.only(right: 10, top: 5,left: 5,),
//                 width: 60,
//                 height: 38,
//                 child: IconButton(
//                   icon: Icon(Icons.notifications),
//                   onPressed: () {},
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body:SingleChildScrollView(

//         child: Column(
//         children: [
//         CarDisplay(),
//       // your widgets here
//     ],
//   ),

// ) ,
//     );
//   }
// }

