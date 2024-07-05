import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/toast_message.dart';
import './bidding_info.dart';

class CarInfo {
  String manufacturer;
  String model;
  String licensePlate;
  String fuelType;
  Color color;
  double? cc;
  int year;
  double mileage;
  double distanceTravelled;
  String vin;
  DateTime? lastOilChangeDate;
  double lastOilChangeDistance;
  List<Bidding> serviceHistory;
  String location;
  Map<String, bool> carFeatures;
  String imgPath;

  //constructor
  CarInfo({
    required this.manufacturer,
    required this.model,
    required this.licensePlate,
    required this.fuelType,
    required this.color,
    required this.year,
    required this.mileage,
    required this.vin,
    required this.imgPath,
    this.cc = 0,
    this.distanceTravelled = 0,
    this.lastOilChangeDistance = 0,
    this.location = "Lahore, Pakistan",
    this.serviceHistory = const [],
    carFeatures,
    lastOilChangeDate,
  })  : carFeatures = carFeatures ??
            {
              "ABS": false,
              "AM/FM Radio": false,
              "Air Bags": false,
              "Air Conditioning": false,
              "Alloy Rims": false,
              "CD Player": false,
              "Cruise Control": false,
              "DVD Player": false,
              "Immobilizer Key": false,
              "Keyless Entry": false,
              "Navigation System": false,
              "Power Locks": false,
              "Power Mirrors": false,
              "Power Steering": false,
              "Power Windows": false,
              "Rear AC Vents": false,
              "Rear Speakers": false,
              "Sun Roof": false,
            },
        lastOilChangeDate = lastOilChangeDate ?? DateTime.now();

  factory CarInfo.fromMap(Map<String, dynamic> data) {
    return CarInfo(
      manufacturer: data['manufacturer'],
      model: data['model'],
      licensePlate: data['licensePlate'],
      fuelType: data['fuelType'],
      color: Color(data['color']),
      year: data['year'],
      mileage: data['mileage'],
      vin: data['vin'],
      imgPath: data['imgPath'],
      cc: data['cc'],
      distanceTravelled: data['distanceTravelled'],
      lastOilChangeDistance: data['lastOilChangeDistance'],
      lastOilChangeDate: (data['lastOilChangeDate'] as Timestamp).toDate(),
      serviceHistory: (data['serviceHistory'] as List<dynamic>)
          .map((e) => Bidding.fromMap(e as Map<String, dynamic>))
          .toList(),
      location: data['location'],
      carFeatures: Map<String, bool>.from(data['carFeatures']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'manufacturer': manufacturer,
      'model': model,
      'licensePlate': licensePlate,
      'fuelType': fuelType,
      'color': color.value,
      'year': year,
      'mileage': mileage,
      'vin': vin,
      'imgPath': imgPath,
      'cc': cc,
      'distanceTravelled': distanceTravelled,
      'lastOilChangeDistance': lastOilChangeDistance,
      'lastOilChangeDate': lastOilChangeDate,
      'serviceHistory': serviceHistory.map((e) => e.toMap()).toList(),
      'location': location,
      'carFeatures': carFeatures,
    };
  }
}

class UserCarsInfo with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _fullname;
  String? _uid;
  String? _email;
  String? _phone;
  DateTime? _bookingDate;
  List<CarInfo> _userCars = [];

  late CarInfo _selectedCar;

  void setUserInfo(Map<String, dynamic>? data) {
    _fullname = data?['fullname'];
    _uid = data?['uid'];
    _email = data?['email'];
    _phone = data?['phone'];
  }

  void setBookingDate(DateTime date) {
    _bookingDate = date;
  }

  DateTime? get getBookingDate => _bookingDate;

  Future<void> fetchUserCars() async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(_uid)
          .collection('cars')
          .get();
      if (snapshot.docs.isNotEmpty) {
        _userCars = _userCars =
            snapshot.docs.map((doc) => CarInfo.fromMap(doc.data())).toList();
        _selectedCar = _userCars.first;
      }
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error fetching user cars: $error');
    }
  }

  void setUserCars(List<CarInfo> cars) {
    _userCars = cars;
    _selectedCar = _userCars.first;
    notifyListeners();
  }

  List<CarInfo> get getCars => _userCars;

  CarInfo get getSelectedCar => _selectedCar;

  String get getSelectedCarLicensePlate => _selectedCar.licensePlate;

  void changeSelectedCar(String licensePlate) {
    _selectedCar = _userCars.firstWhere(
      (element) => element.licensePlate == licensePlate,
    );
    notifyListeners();
  }

  String? get getName => _fullname;

  String? get getUid => _uid;

  String? get getEmail => _email;

  String? get getPhone => _phone;

  Future<void> addCar(CarInfo car) async {
    try {
      await _firestore
          .collection('users')
          .doc(_uid)
          .collection('cars')
          .doc(car.licensePlate)
          .set(car.toMap());
      _userCars.add(car);
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error adding car: $error');
    }
  }

  Future<void> deleteCar(String licensePlate) async {
    try {
      await _firestore
          .collection('users')
          .doc(_uid)
          .collection('cars')
          .doc(licensePlate)
          .delete();

      final storageRef = FirebaseStorage.instance.ref().child(
            'car_images/$licensePlate',
          );

      await storageRef.delete();

      _userCars.removeWhere(
        (car) => car.licensePlate == licensePlate,
      );
      notifyListeners();
    } catch (error) {
      ToastMessage().toastmessage('Error deleting car: $error');
    }
  }

  Future<void> updateServiceHistory(
    String licensePlate,
    List<Bidding> serviceHistory,
  ) async {
    try {
      final carRef = _firestore
          .collection('users')
          .doc(_uid)
          .collection('cars')
          .doc(licensePlate);
      await carRef.update({
        'serviceHistory': serviceHistory.map((e) => e.toMap()).toList(),
      });
      // Optionally, update local model and notify listeners
      int index = _userCars.indexWhere(
        (car) => car.licensePlate == licensePlate,
      );
      if (index != -1) {
        _userCars[index].serviceHistory = serviceHistory;
        notifyListeners();
      }
    } catch (error) {
      ToastMessage().toastmessage('Failed to update service history: $error');
    }
  }

  Future<void> updateCarFeatures(
    String licensePlate,
    Map<String, bool> carFeatures,
  ) async {
    try {
      await _firestore
          .collection('users')
          .doc(_uid)
          .collection('cars')
          .doc(licensePlate)
          .update(
        {
          'carFeatures': carFeatures,
        },
      );
      // Optionally, update local model and notify listeners
      int index = _userCars.indexWhere(
        (car) => car.licensePlate == licensePlate,
      );
      if (index != -1) {
        _userCars[index].carFeatures = carFeatures;
        notifyListeners();
      }
    } catch (error) {
      ToastMessage().toastmessage('Failed to update car features: $error');
    }
  }

  Future<void> uploadPicture(String licensePlate) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        ToastMessage().toastmessage('No image selected');
        return;
      }

      final file = File(pickedFile.path);
      final metadata = SettableMetadata(contentType: 'image/jpeg');
      final storageRef = FirebaseStorage.instance.ref().child(
            'car_images/$licensePlate',
          );

      // Upload the file
      final snapshot = await storageRef.putFile(file, metadata);

      // Get the download URL
      final downloadUrl = await snapshot.ref.getDownloadURL();

      // Update Firestore with the new image URL
      await updateCarImgPath(licensePlate, downloadUrl);

      ToastMessage().toastmessage('Image uploaded successfully');
    } catch (error) {
      ToastMessage().toastmessage('Failed to upload image: $error');
    }
  }

  Future<void> updateCarImgPath(String licensePlate, String imgPath) async {
    try {
      await _firestore
          .collection('users')
          .doc(_uid)
          .collection('cars')
          .doc(licensePlate)
          .update(
        {
          'imgPath': imgPath,
        },
      );
      // Optionally, update local model and notify listeners
      int index = _userCars.indexWhere(
        (car) => car.licensePlate == licensePlate,
      );
      if (index != -1) {
        _userCars[index].imgPath = imgPath;
        notifyListeners();
      }
    } catch (error) {
      ToastMessage().toastmessage('Failed to update car image path: $error');
    }
  }

  // get all manufacturers
  List<String> get getManufacturers =>
      _userCars.map((car) => car.manufacturer).toSet().toList();

  String getManufacturerByLicensePlate(String licensePlate) {
    return _userCars
        .firstWhere(
          (element) => element.licensePlate == licensePlate,
        )
        .manufacturer;
  }

  // get car features by linecse plate
  Map<String, bool> getCarFeaturesByLicensePlate(String licensePlate) {
    return _userCars
        .firstWhere(
          (element) => element.licensePlate == licensePlate,
        )
        .carFeatures;
  }

  Future<void> updateCarDistanceAndOilChange(
    String licensePlate,
    double distance,
    double oilChangeDistance,
  ) async {
    int index = _userCars.indexWhere(
      (element) => element.licensePlate == licensePlate,
    );
    if (index != -1) {
      _userCars[index].distanceTravelled += distance;
      _userCars[index].lastOilChangeDistance = oilChangeDistance;

      try {
        final carRef = _firestore
            .collection('users')
            .doc(_uid)
            .collection('cars')
            .doc(licensePlate);
        await carRef.update({
          'distanceTravelled': _userCars[index].distanceTravelled,
          'lastOilChangeDistance': oilChangeDistance,
        });
        notifyListeners();
      } catch (error) {
        ToastMessage().toastmessage(
          'Failed to update car distance and oil change: $error',
        );
      }
    }
  }

  Future<void> addServiceHistory(
    Bidding serviceHistory,
  ) async {
    int index = _userCars.indexWhere(
      (element) => element.licensePlate == _selectedCar.licensePlate,
    );
    if (index != -1) {
      _userCars[index].serviceHistory.add(serviceHistory);

      try {
        final carRef = _firestore
            .collection('users')
            .doc(_uid)
            .collection('cars')
            .doc(_selectedCar.licensePlate);
        await carRef.update({
          'serviceHistory':
              _userCars[index].serviceHistory.map((e) => e.toMap()).toList(),
        });
        notifyListeners();
      } catch (error) {
        ToastMessage().toastmessage(
          'Failed to add service history: $error',
        );
      }
    }
  }

  void updateCarDistanceTravelled(String licensePlate, double distance) {
    int index = _userCars.indexWhere(
      (element) => element.licensePlate == licensePlate,
    );
    if (index != -1) {
      _userCars[index].distanceTravelled += distance;
      notifyListeners();
    }
  }

  void updateCarLastOilChangeDistance(String licensePlate, double distance) {
    int index = _userCars.indexWhere(
      (element) => element.licensePlate == licensePlate,
    );
    if (index != -1) {
      _userCars[index].lastOilChangeDistance = distance;
      notifyListeners();
    }
  }

  CarInfo getCarByLicensePlate(String licensePlate) {
    return _userCars.firstWhere(
      (element) => element.licensePlate == licensePlate,
    );
  }

  bool isCarExist(String licensePlate) {
    return _userCars.any(
      (element) => element.licensePlate == licensePlate,
    );
  }

  void removeAllCars() {
    _userCars.clear();
    notifyListeners();
  }
}
