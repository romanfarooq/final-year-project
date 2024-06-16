import 'package:flutter/material.dart';
class CarInfo {
  String manufacture;
  String model;
  String licensePlate;
  Color color;
  double cc;
  int year;
  //double mileage;
  double distanceTravelled;
  //String vin;
  DateTime lastOilChange;
  // Service history;
  //Location location;
  Map<String, bool> carFeatures;
  String imgPath;

  //constructor
  CarInfo({
    required this.manufacture,
    required this.model,
    required this.licensePlate,
    required this.color,
    required this.cc,
    required this.year,
    //required this.mileage,
    required this.distanceTravelled,
    //required this.vin,
    required this.lastOilChange,
    //required this.serviceHistory,
    required this.imgPath,
    Map<String, bool>? carFeatures,
  }) : carFeatures = carFeatures ?? {
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
  };
}

class UserCarsInfo with ChangeNotifier {
  final List<CarInfo> _userCars = [
    CarInfo(
      manufacture: "Honda",
      model: "CR-V",
      licensePlate: "1234",
      color: Colors.red,
      cc: 1.5,
      year: 2019,
      //mileage: 15km/l,
      distanceTravelled: 10000,
      //vin: "1234567890",
      lastOilChange: DateTime.utc(2024, 05,25),
      //serviceHistory: [],
      imgPath: 'assets/images/carlogo/Honda_CR-V.jpg',
    ),
    CarInfo(
      manufacture: "BMW",
      model: "X5",
      licensePlate: "4321",
      color: Colors.blue,
      cc: 3.0,
      year: 2020,
      //mileage: 10km/l,
      distanceTravelled: 20000,
      //vin: "0987654321",
      lastOilChange: DateTime.utc(2024, 05,25),
      //serviceHistory: [],
      imgPath: 'assets/images/carlogo/Honda_CR-V.jpg',
    ),
  ];

  List<CarInfo> get getCars => _userCars.toList();

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
