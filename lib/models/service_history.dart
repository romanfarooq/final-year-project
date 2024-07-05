import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceHistory {
  String serviceType;
  String serviceItem;
  DateTime serviceDate;
  double serviceCost;
  double partCost;
  String serviceCenter;
  String serviceNote;

  ServiceHistory({
    required this.serviceType,
    required this.serviceItem,
    required this.serviceCost,
    required this.partCost,
    required this.serviceCenter,
    required this.serviceNote,
    required this.serviceDate,
  });

  factory ServiceHistory.fromMap(Map<String, dynamic> data) {
    return ServiceHistory(
      serviceType: data['serviceType'],
      serviceItem: data['serviceItem'],
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
      'serviceItem': serviceItem,
      'serviceCost': serviceCost,
      'partCost': partCost,
      'serviceCenter': serviceCenter,
      'serviceNote': serviceNote,
      'serviceDate': serviceDate,
    };
  }
}
