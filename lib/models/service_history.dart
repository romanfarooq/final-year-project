import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceHistory {
  String serviceType;
  DateTime serviceDate;
  double serviceCost;
  double partCost;
  String serviceCenter;
  String serviceNote;

  ServiceHistory({
    required this.serviceType,
    required this.serviceCost,
    required this.partCost,
    required this.serviceCenter,
    required this.serviceNote,
    serviceDate,
  }) : serviceDate = serviceDate ?? DateTime.now();

  factory ServiceHistory.fromMap(Map<String, dynamic> data) {
    return ServiceHistory(
      serviceType: data['serviceType'],
      serviceCost: data['serviceCost'],
      partCost: data['partCost'],
      serviceCenter: data['serviceCenter'],
      serviceNote: data['serviceNote'],
      serviceDate: (data['serviceDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceType': serviceType,
      'serviceCost': serviceCost,
      'partCost': partCost,
      'serviceCenter': serviceCenter,
      'serviceNote': serviceNote,
      'serviceDate': serviceDate,
    };
  }
}
