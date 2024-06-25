import 'package:flutter/material.dart';

import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_service_widget.dart';

class CarCareRequests extends StatefulWidget {
  const CarCareRequests({super.key});

  @override
  State<CarCareRequests> createState() => _CarCareRequestsState();
}

class _CarCareRequestsState extends State<CarCareRequests> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: figmaSpaceToPercentage(55, context),
          ),
          Center(
            child: Image.asset(
              ImageConstant.carcare1,
              height: 29,
              width: 106,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(
            height: figmaSpaceToPercentage(90, context),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomServiceWidget(
                    carName: 'Car A',
                    ownerName: 'Alice Anderson',
                    carModel: 'XYZ Sedan',
                    issueType: 'waqar Issue',
                    issueDescription:
                        'Engine not starting, strange noises during operation.',
                  ),
                  CustomServiceWidget(
                    carName: 'Car A',
                    ownerName: 'Alice Anderson',
                    carModel: 'XYZ Sedan',
                    issueType: 'waqar Issue',
                    issueDescription:
                        'Engine not starting, strange noises during operation.',
                  ),
                  CustomServiceWidget(
                    carName: 'Car A',
                    ownerName: 'Alice Anderson',
                    carModel: 'XYZ Sedan',
                    issueType: 'waqar Issue',
                    issueDescription:
                        'Engine not starting, strange noises during operation.',
                  ),
                  CustomServiceWidget(
                    carName: 'Car A',
                    ownerName: 'Alice Anderson',
                    carModel: 'XYZ Sedan',
                    issueType: 'waqar Issue',
                    issueDescription:
                        'Engine not starting, strange noises during operation.',
                  ),
                  CustomServiceWidget(
                    carName: 'Car A',
                    ownerName: 'Alice Anderson',
                    carModel: 'XYZ Sedan',
                    issueType: 'waqar Issue',
                    issueDescription:
                        'Engine not starting, strange noises during operation.',
                  ),
                  CustomServiceWidget(
                    carName: 'Car A',
                    ownerName: 'Alice Anderson',
                    carModel: 'XYZ Sedan',
                    issueType: 'waqar Issue',
                    issueDescription:
                        'Engine not starting, strange noises during operation.',
                  ),
                  CustomServiceWidget(
                    carName: 'Car A',
                    ownerName: 'Alice Anderson',
                    carModel: 'XYZ Sedan',
                    issueType: 'waqar Issue',
                    issueDescription:
                        'Engine not starting, strange noises during operation.',
                  ),
                  CustomServiceWidget(
                    carName: 'Car A',
                    ownerName: 'Alice Anderson',
                    carModel: 'XYZ Sedan',
                    issueType: 'waqar Issue',
                    issueDescription:
                        'Engine not starting, strange noises during operation.',
                  ),
                  CustomServiceWidget(
                    carName: 'Car A',
                    ownerName: 'Alice Anderson',
                    carModel: 'XYZ Sedan',
                    issueType: 'waqar Issue',
                    issueDescription:
                        'Engine not starting, strange noises during operation.',
                  ),
                  CustomServiceWidget(
                    carName: 'Car A',
                    ownerName: 'Alice Anderson',
                    carModel: 'XYZ Sedan',
                    issueType: 'waqar Issue',
                    issueDescription:
                        'Engine not starting, strange noises during operation.',
                  ),
                  CustomServiceWidget(
                    carName: 'Car A',
                    ownerName: 'Alice Anderson',
                    carModel: 'XYZ Sedan',
                    issueType: 'waqar Issue',
                    issueDescription:
                        'Engine not starting, strange noises during operation.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
