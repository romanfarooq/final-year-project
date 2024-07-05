import 'package:flutter/material.dart';

import '../utils/figma_space_to_percentage.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

// Not Completed yet
class _BillingScreenState extends State<BillingScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  bool isEditing = true;

  List<Map<String, TextEditingController>> chargesList = [
    {
      'partName': TextEditingController(),
      'partPrice': TextEditingController(),
      'serviceName': TextEditingController(),
      'servicePrice': TextEditingController(),
    }
  ];

  double calculateTotal() {
    double total = 0.0;
    for (var charge in chargesList) {
      double partPrice = double.tryParse(charge['partPrice']?.text ?? '0') ?? 0;
      double servicePrice =
          double.tryParse(charge['servicePrice']?.text ?? '0') ?? 0;
      total += partPrice + servicePrice;
    }
    return total;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    for (var charge in chargesList) {
      charge['partName']?.dispose();
      charge['partPrice']?.dispose();
      charge['serviceName']?.dispose();
      charge['servicePrice']?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Billing Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  controller: _descriptionController,
                  enabled: isEditing,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: "Describe your issue here",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(50, 50, 50, 0.6),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding:
                        EdgeInsets.only(right: 25, bottom: 10, top: 20),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chargesList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        // Part and Service Names
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(200, context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: chargesList[index]['partName'],
                                enabled: isEditing,
                                style: const TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Part Name',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    figmaSpaceToPercentageHeight(15, context),
                              ),
                              TextField(
                                controller: chargesList[index]['serviceName'],
                                enabled: isEditing,
                                style: const TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Service Name',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(20, context),
                        ),
                        Container(
                          width: 1, // Width of the vertical line
                          height: 60, // Height of the vertical line
                          color: Colors.black, // Color of the vertical line
                        ),
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(20, context),
                        ),
                        // Part and Service Prices
                        SizedBox(
                          width: figmaSpaceToPercentageWidth(150, context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: chargesList[index]['partPrice'],
                                enabled: isEditing,
                                style: const TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Part Price',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                height:
                                    figmaSpaceToPercentageHeight(15, context),
                              ),
                              TextField(
                                controller: chargesList[index]['servicePrice'],
                                enabled: isEditing,
                                style: const TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Service Price',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Text(
              "Total: Rs. ${calculateTotal()}",
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  chargesList.add({
                    'partName': TextEditingController(),
                    'partPrice': TextEditingController(),
                    'serviceName': TextEditingController(),
                    'servicePrice': TextEditingController(),
                  });
                });
              },
              child: const Text("Add Part/Service"),
            ),
          ],
        ),
      ),
    );
  }
}
