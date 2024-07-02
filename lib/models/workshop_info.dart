import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import './service_history.dart';
import '../utils/toast_message.dart';

class WorkshopInfo with ChangeNotifier {
  String? uid;
  String? fullname;
  String? workshopName;
  String? email;
  String? phone;
  String? location;
  double? ratingStars;
  String? description;
  String? openingHours;
  String? website;
  List<ServiceHistory> serviceHistory;

  Map<String, bool> electricalRepairs;
  Map<String, bool> mechanicalRepairs;
  Map<String, bool> dentingPaintingServices;
  Map<String, bool> tireServices;

  // constructor
  WorkshopInfo({
    this.uid,
    this.fullname,
    this.workshopName = '',
    this.email,
    this.phone,
    this.location = '',
    this.description = '',
    this.openingHours = '',
    this.website = '',
    this.ratingStars = 0,
    this.serviceHistory = const [],
    electricalRepairs,
    mechanicalRepairs,
    dentingPaintingServices,
    tireServices,
  })  : electricalRepairs = electricalRepairs ??
            {
              "Lights": false,
              "AC": false,
              "Multimedia": false,
              "Battery": false,
              "Starter Motor": false,
              "Alternator": false,
              "Ignition System": false,
              "Power Windows and Locks": false,
              "Power Seats": false,
              "Electrical Wiring": false,
              "Sensors": false,
              "ECU (Engine Control Unit) Diagnostics": false,
              "Fuse Box and Fuses": false,
              "Lighting Control Module": false,
              "Instrument Cluster": false,
              "Horn": false,
              "Power Steering": false,
              "Central Locking System": false,
              "Cruise Control": false,
              "Security and Alarm Systems": false,
              "Communication Systems": false,
              "Heated Seats and Mirrors": false,
            },
        mechanicalRepairs = mechanicalRepairs ??
            {
              "Engine Oil": false,
              "Engine Repairs": false,
              "Brakes": false,
              "Transmission Services": false,
              "Exhaust System": false,
              "Suspension System": false,
              "Steering System": false,
              "Clutch System": false,
              "Fuel System": false,
              "Cooling System": false,
              "Timing Belt/Chain Replacement": false,
              "Drive Belts and Chains": false,
              "Engine Overhaul": false,
              "Fuel Injection System": false,
              "Air Intake System": false,
              "Throttle Body": false,
              "Engine Mounts": false,
              "Gaskets and Seals": false,
              "Powertrain Services": false,
              "Differential Services": false,
              "CV Joints and Boots": false,
              "Wheel Bearings": false,
              "Axle and Drivetrain Services": false,
            },
        dentingPaintingServices = dentingPaintingServices ??
            {
              "Dent Removal": false,
              "Painting (Full or Partial)": false,
              "Vehicle Wrapping": false,
              "Paintwork Touch-ups": false,
              "Collision Repairs": false,
              "Paint Protection Film (PPF) Installation": false,
              "Custom Paint Jobs": false,
              "Scratch Repairs": false,
              "Rust Repairs": false,
              "Clear Coat Application": false,
              "Panel Replacement": false,
              "Color Matching": false,
              "Surface Preparation": false,
              "Clear Bra Installation (Transparent paint protection)": false,
              "Paint Polishing and Buffing": false,
              "Weather Damage Repairs": false,
              "Hail Damage Repairs": false,
              "Headlight Restoration (if part of the painting services)": false,
              "Detailing Before/After Painting": false,
              "Custom Graphics": false,
            },
        tireServices = tireServices ??
            {
              "Tire Installation": false,
              "Tire Balancing": false,
              "Wheel Alignment": false,
              "Tire Repairs (Puncture repairs)": false,
              "Tire Rotation": false,
              "Tire Inspection": false,
              "Tire Replacement": false,
              "Tire Pressure Checks": false,
              "Flat Tire Repair": false,
              "Tire Mounting": false,
              "Tire Disposal": false,
              "TPMS (Tire Pressure Monitoring System) Inspection and Service":
                  false,
              "Wheel Rim Inspection and Repairs": false,
              "Tire Inflation Services": false,
              "Tire Sales (New and Used)": false,
              "Seasonal Tire Swapping": false,
              "Run-Flat Tire Services": false,
              "Tire Tread Depth Measurement": false,
              "Tire Pressure Monitoring System (TPMS) Replacement": false,
              "Nitrogen Inflation Services": false,
              "Tire Storage Services": false,
              "Performance Tire Upgrades": false,
              "Custom Tire and Wheel Packages": false,
            };

  factory WorkshopInfo.fromMap(Map<String, dynamic> data) {
    return WorkshopInfo(
      uid: data['uid'],
      fullname: data['fullname'],
      workshopName: data['workshopName'],
      email: data['email'],
      phone: data['phone'],
      location: data['location'],
      openingHours: data['openingHours'],
      website: data['website'],
      ratingStars: double.tryParse(data['ratingStars'] ?? 0) ?? 0,
      serviceHistory: (data['serviceHistory'] as List<dynamic>)
          .map((e) => ServiceHistory.fromMap(e as Map<String, dynamic>))
          .toList(),
      electricalRepairs: Map<String, bool>.from(data['electricalRepairs']),
      mechanicalRepairs: Map<String, bool>.from(data['mechanicalRepairs']),
      dentingPaintingServices:
          Map<String, bool>.from(data['dentingPaintingServices']),
      tireServices: Map<String, bool>.from(data['tireServices']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullname': fullname,
      'workshopName': workshopName,
      'email': email,
      'phone': phone,
      'location': location,
      'openingHours': openingHours,
      'website': website,
      'ratingStars': ratingStars,
      'serviceHistory': serviceHistory.map((e) => e.toMap()).toList(),
      'electricalRepairs': electricalRepairs,
      'mechanicalRepairs': mechanicalRepairs,
      'dentingPaintingServices': dentingPaintingServices,
      'tireServices': tireServices,
    };
  }

  void setWorkshopInfo(Map<String, dynamic> data) {
    uid = data['uid'] ?? uid;
    fullname = data['fullname'] ?? fullname;
    email = data['email'] ?? email;
    phone = data['phone'] ?? phone;
    notifyListeners();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  get getWorkshopName => workshopName;

  get getElectricalRepairs => electricalRepairs;

  get getMechanicalRepairs => mechanicalRepairs;

  get getDentingPaintingServices => dentingPaintingServices;

  get getTireServices => tireServices;

  Future<void> updateWorkshopInfo({
    required String workshopName,
    required String location,
    required String contact,
    required String website,
    required String openingHours,
    required String description,
  }) async {
    try {
      await _firestore.collection('workshops').doc(uid).update({
        'workshopName': workshopName,
        'location': location,
        'phone': contact,
        'website': website,
        'openingHours': openingHours,
        'description': description,
      });
      this.workshopName = workshopName;
      this.location = location;
      phone = contact;
      this.website = website;
      this.openingHours = openingHours;
      this.description = description;
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error updating workshop info: $error');
    }
  }

  Future<void> updateRating(double newRating) async {
    try {
      await _firestore
          .collection('workshops')
          .doc(uid)
          .update({'ratingStars': newRating});
      ratingStars = newRating;
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error updating rating: $error');
    }
  }

  Future<void> updateServiceHistory(
    List<ServiceHistory> newServiceHistory,
  ) async {
    try {
      await _firestore.collection('workshops').doc(uid).update(
          {'serviceHistory': newServiceHistory.map((e) => e.toMap()).toList()});
      serviceHistory = newServiceHistory;
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error updating service history: $error');
    }
  }

  Future<void> updateElectricalRepairs(Map<String, bool> newRepairs) async {
    try {
      await _firestore
          .collection('workshops')
          .doc(uid)
          .update({'electricalRepairs': newRepairs});
      electricalRepairs = newRepairs;
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error updating electrical repairs: $error');
    }
  }

  Future<void> updateMechanicalRepairs(Map<String, bool> newRepairs) async {
    try {
      await _firestore
          .collection('workshops')
          .doc(uid)
          .update({'mechanicalRepairs': newRepairs});
      mechanicalRepairs = newRepairs;
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error updating mechanical repairs: $error');
    }
  }

  Future<void> updateDentingPaintingServices(
      Map<String, bool> newServices) async {
    try {
      await _firestore
          .collection('workshops')
          .doc(uid)
          .update({'dentingPaintingServices': newServices});
      dentingPaintingServices = newServices;
      notifyListeners();
    } catch (error) {
      ToastMessage()
          .toastmessage('Error updating denting and painting services: $error');
    }
  }

  Future<void> updateTireServices(Map<String, bool> newServices) async {
    try {
      await _firestore
          .collection('workshops')
          .doc(uid)
          .update({'tireServices': newServices});
      tireServices = newServices;
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error updating tire services: $error');
    }
  }
}

class Workshop with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<WorkshopInfo> _workshops = [];

  Future<void> fetchWorkshops(String uid) async {
    try {
      final snapshot = await _firestore.collection('workshops').get();
      if (snapshot.docs.isNotEmpty) {
        _workshops = snapshot.docs
            .map((doc) => WorkshopInfo.fromMap(doc.data()))
            .toList();
      }
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error fetching workshops: $error');
    }
  }

  List<WorkshopInfo> get getWorkshops => _workshops;

  Future<void> addWorkshop(WorkshopInfo workshop) async {
    try {
      await _firestore
          .collection('workshops')
          .doc(workshop.uid)
          .set(workshop.toMap());
      _workshops.add(workshop);
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error adding workshop: $error');
    }
  }

  Future<void> removeWorkshop(WorkshopInfo workshop) async {
    try {
      await _firestore.collection('workshops').doc(workshop.uid).delete();
      _workshops.removeWhere(
        (element) => element.uid == workshop.uid,
      );
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error removing workshop: $error');
    }
  }

  Future<void> updateWorkshop(WorkshopInfo workshop) async {
    try {
      await _firestore
          .collection('workshops')
          .doc(workshop.uid)
          .update(workshop.toMap());
      int index = _workshops.indexWhere(
        (element) => element.uid == workshop.uid,
      );
      if (index != -1) {
        _workshops[index] = workshop;
        notifyListeners();
      }
    } catch (error) {
      ToastMessage().toastmessage('Error updating workshop: $error');
    }
  }
}
