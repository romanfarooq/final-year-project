import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/toast_message.dart';

class Bidding {
  String serviceCenterId;
  double serviceCost;
  double partCost;
  String serviceCenter;
  bool isAccepted = false;
  LatLng serviceLocation = const LatLng(0, 0);

  Bidding({
    required this.serviceCost,
    required this.partCost,
    required this.serviceCenter,
    required this.isAccepted,
    required this.serviceLocation,
    required this.serviceCenterId,
  });

  factory Bidding.fromMap(Map<String, dynamic> data) {
    return Bidding(
      serviceCenterId: data['serviceCenterId'],
      serviceCost: data['serviceCost'],
      isAccepted: data['isAccepted'],
      partCost: data['partCost'],
      serviceCenter: data['serviceCenter'],
      serviceLocation: LatLng(data['serviceLocation']['latitude'],
          data['serviceLocation']['longitude']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceCenterId': serviceCenterId,
      'serviceCost': serviceCost,
      'partCost': partCost,
      'serviceCenter': serviceCenter,
      'isAccepted': isAccepted,
      'serviceLocation': {
        'latitude': serviceLocation.latitude,
        'longitude': serviceLocation.longitude,
      },
    };
  }
}

class BiddingInfo with ChangeNotifier {
  final _ref = FirebaseFirestore.instance;

  String? _userId;
  String? _serviceType;
  String? _serviceItem;
  String? _serviceDescription;
  DateTime? _serviceDate;
  LatLng? _userLocation;
  final List<Bidding> _biddings = [];
  List<Bidding> get biddings => _biddings;

  Future<void> setBidding(
    String userId,
    String serviceType,
    String serviceItem,
    String serviceDescription,
    DateTime serviceDate,
    LatLng userLocation,
  ) async {
    try {
      _userId = userId;
      _serviceType = serviceType;
      _serviceItem = serviceItem;
      _serviceDate = serviceDate;
      _serviceDescription = serviceDescription;
      _userLocation = userLocation;

      await _ref.collection('biddings').doc(userId).set(
        {
          'serviceType': _serviceType,
          'serviceItem': _serviceItem,
          'serviceDate': _serviceDate,
          'serviceDescription': _serviceDescription,
          'userLocation': {
            'latitude': _userLocation!.latitude,
            'longitude': _userLocation!.longitude,
          },
          'biddings': [],
        },
      );
    } catch (error) {
      ToastMessage().toastmessage('Error: $error');
    }
  }

  Future<void> deleteBidding() async {
    try {
      await _ref.collection('biddings').doc(_userId).delete();
      _userId = null;
      _serviceType = null;
      _serviceItem = null;
      _serviceDescription = null;
      _serviceDate = null;
      _userLocation = null;
      _biddings.clear();
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error: $error');
    }
  }

  Future<void> addBidding(Bidding bidding) async {
    try {
      _biddings.add(bidding);
      await _ref.collection('biddings').doc(_userId).update({
        'biddings': _biddings.map((e) => e.toMap()).toList(),
      });
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error: $error');
    }
  }

  Future<void> fetchBiddings(String userId) async {
    try {
      final data = await _ref.collection('biddings').doc(userId).get();
      if (data.exists) {
        final biddings = data.data()!['biddings'] as List;
        _biddings.clear();
        for (final bid in biddings) {
          _biddings.add(Bidding.fromMap(bid));
        }
        notifyListeners();
      }
    } catch (error) {
      ToastMessage().toastmessage('Error: $error');
    }
  }
}
