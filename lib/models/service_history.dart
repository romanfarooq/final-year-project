import 'package:cloud_firestore/cloud_firestore.dart';

enum ServiceType {
  mchanicalRepair,
  electricalRepair,
  dentingPainting,
  wheelRepair,
  oilChange,
  tireReplace,
  wheelBalancing,
  carWash,
}

class ServiceHistory {
  ServiceType serviceType;
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
      serviceType: ServiceType.values[data['serviceType']],
      serviceCost: data['serviceCost'],
      partCost: data['partCost'],
      serviceCenter: data['serviceCenter'],
      serviceNote: data['serviceNote'],
      serviceDate: (data['serviceDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceType': serviceType.index,
      'serviceCost': serviceCost,
      'partCost': partCost,
      'serviceCenter': serviceCenter,
      'serviceNote': serviceNote,
      'serviceDate': serviceDate,
    };
  }
}
