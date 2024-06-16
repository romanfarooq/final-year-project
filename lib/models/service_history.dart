
// ignore_for_file: constant_identifier_names
enum ServiceType {
  MechanicalRepair,
  ElectricalRepair,
  DentingPainting,
  WheelRepair,
  OilChange,
}
class ServiceHistory {
  final ServiceType serviceType;
  final DateTime serviceDate;
  final double serviceCost;
  final double partCost;
  final String serviceCenter;
  final String serviceNote;

  ServiceHistory({
    required this.serviceType,
    required this.serviceDate,
    required this.serviceCost,
    required this.partCost,
    required this.serviceCenter,
    required this.serviceNote,
  });
}