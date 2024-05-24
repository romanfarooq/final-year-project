import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import '../widgets/service_history_widget.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import 'service_history_details.dart';

class ServiceHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SingleChildScrollView(
        child: Column(
            children: [

              SizedBox(
                height: figmaSpaceToPercentage(69, context),
              ),
      
              Column(
                children:[
                  Center(
                  child: Text(
                    'Service History',
                    style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(26, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none),
                  ),
                ),
        ]
              ),
      
              SizedBox(
                height: figmaSpaceToPercentage(25, context),
              ),
          //wa

              Column(
                  children:[

                    ServiceHistoryWidget(
                      date: '29',
                      month: 'June',
                      year: '2024',
                     serviceType: 'Mechanical',

                    ),

                    ServiceHistoryWidget(
                      date: '29',
                      month: 'June',
                      year: '2024',
                      serviceType: 'Electrical',

                    ),

                    ServiceHistoryWidget(
                      date: '29',
                      month: 'June',
                      year: '2024',
                      serviceType: 'DentingNpainting',

                    ),


                    ServiceHistoryWidget(
                      date: '29',
                      month: 'June',
                      year: '2024',
                      serviceType: 'Tire',

                    ),


                    ServiceHistoryWidget(
                      date: '29',
                      month: 'June',
                      year: '2024',
                      serviceType: 'Mechanical',

                    ),










                  ]
                  ),
            ],
          ),
      ),
    );

  }
}

// Text("Date: ${widget.date}"),
// Text("Month: ${widget.month}"),
// Text("Year: ${widget.year}"),
// Text("Service Type: ${widget.serviceType}"),