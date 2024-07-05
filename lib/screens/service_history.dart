import 'package:flutter/material.dart';

import '../utils/figma_space_to_percentage.dart';
import '../widgets/service_history_widget.dart';

class ServiceHistory extends StatelessWidget {
  const ServiceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: figmaSpaceToPercentageHeight(69, context),
              ),

              Column(
                children: [
                  Center(
                    child: Text(
                      'Service History',
                      style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: figmaSpaceToPercentageHeight(26, context),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: figmaSpaceToPercentageHeight(25, context),
              ),
              //wa

              const Column(
                children: [
                  ServiceHistoryWidget(
                    date: '2',
                    month: 'June',
                    year: '2024',
                    serviceType: 'Mechanical',
                  ),
                  ServiceHistoryWidget(
                    date: '15',
                    month: 'June',
                    year: '2024',
                    serviceType: 'Electrical',
                  ),
                  ServiceHistoryWidget(
                    date: '29',
                    month: 'JULY',
                    year: '2024',
                    serviceType: 'DentingNpainting',
                  ),
                  ServiceHistoryWidget(
                    date: '14',
                    month: 'AUGUST',
                    year: '2024',
                    serviceType: 'Tire',
                  ),
                  ServiceHistoryWidget(
                    date: '17',
                    month: 'DEC',
                    year: '2024',
                    serviceType: 'Mechanical',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Text("Date: ${widget.date}"),
// Text("Month: ${widget.month}"),
// Text("Year: ${widget.year}"),
// Text("Service Type: ${widget.serviceType}"),