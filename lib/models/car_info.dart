import 'package:flutter/material.dart';

enum Role { user, workshop }

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
  // Service history;
  //Location location;
  Map<String, bool> carFeatures;
  String imgPath;

  //constructor
  CarInfo({
    required this.manufacturer,
    required this.model,
    required this.licensePlate,
    required this.fuelType,
    required this.color,
    this.cc,
    required this.year,
    required this.mileage,
    this.distanceTravelled = 0,
    required this.vin,
    lastOilChangeDate,
    this.lastOilChangeDistance = 0,
    //required this.serviceHistory,
    required this.imgPath,
    this.carFeatures = const {
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
  }) : lastOilChangeDate = lastOilChangeDate ?? DateTime.now();
}

class UserCarsInfo with ChangeNotifier {
  final String _name = "John Doe";
  final Role _role = Role.user;
  final List<CarInfo> _userCars = [
    CarInfo(
      manufacturer: "Honda",
      model: "CR-V",
      licensePlate: "1234",
      fuelType: "Petrol",
      color: Colors.red,
      cc: 1.5,
      year: 2019,
      mileage: 15,
      distanceTravelled: 13464,
      vin: "1234567890",
      lastOilChangeDistance: 145,
      lastOilChangeDate: DateTime.utc(2024, 05, 25),
      //serviceHistory: [],
      imgPath: 'assets/images/carlogo/Honda_CR-V.jpg',
    ),
    CarInfo(
      manufacturer: "BMW",
      model: "X5",
      licensePlate: "4321",
      fuelType: "Diesel",
      color: Colors.blue,
      cc: 3.0,
      year: 2020,
      mileage: 10,
      distanceTravelled: 21953,
      vin: "0987654321",
      lastOilChangeDistance: 201,
      lastOilChangeDate: DateTime.utc(2024, 05, 25),
      //serviceHistory: [],
      imgPath: 'assets/images/carlogo/Honda_CR-V.jpg',
    ),
  ];

  late CarInfo _selectedCar;

  UserCarsInfo() {
    _selectedCar = _userCars.first;
  }

  CarInfo get getSelectedCar => _selectedCar;

  void changeSelectedCar(String licensePlate) {
    _selectedCar = _userCars.firstWhere(
      (element) => element.licensePlate == licensePlate,
    );
    notifyListeners();
  }

  String get getRole => _role.toString();

  String get getName => _name;

  List<CarInfo> get getCars => _userCars.toList();

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

  void addCar(CarInfo car) {
    _userCars.add(car);
    notifyListeners();
  }

  void removeCar(CarInfo car) {
    _userCars.removeWhere(
      (element) => element.licensePlate == car.licensePlate,
    );
    notifyListeners();
  }

  void updateCar(CarInfo car) {
    int index = _userCars.indexWhere(
      (element) => element.licensePlate == car.licensePlate,
    );
    if (index != -1) {
      _userCars[index] = car;
      notifyListeners();
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
