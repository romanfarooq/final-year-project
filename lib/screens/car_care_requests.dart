import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bidding_info.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_service_widget.dart';

class CarCareRequests extends StatelessWidget {
  const CarCareRequests({super.key});
  @override
  Widget build(BuildContext context) {
    final biddingInfo = context.watch<BiddingInfo>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: figmaSpaceToPercentageHeight(55, context)),
            Center(
              child: Image.asset(
                ImageConstant.carcare1,
                height: 29,
                width: 106,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: figmaSpaceToPercentageHeight(40, context)),
            Expanded(
              child: StreamBuilder<List<Map<String, dynamic>>>(
                stream: biddingInfo.getBiddingsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No offers available'));
                  }
                  final biddings = snapshot.data!;
                  return ListView.builder(
                    itemCount: biddings.length,
                    itemBuilder: (context, index) {
                      final bidding = biddings[index];
                      return CustomServiceWidget(
                        carName: bidding['carName'],
                        ownerName: bidding['ownerName'],
                        carModel: bidding['carModel'],
                        issueType: bidding['serviceType'],
                        issueDescription: bidding['serviceDescription'],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
