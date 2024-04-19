import 'package:flutter/foundation.dart';

class CarInfo {
  String name;
  String licensePlate;
  String imgPath;

  CarInfo({
    required this.name,
    required this.licensePlate,
    required this.imgPath,
  });
}

class UserCarsInfo with ChangeNotifier {
  final List<CarInfo> _userCars = [
    CarInfo(
      name: "Honda",
      licensePlate: "1234",
      imgPath: 'assets/images/carlogo/Honda_CR-V.jpg',
    ),
    CarInfo(
      name: "BMW",
      licensePlate: "4321",
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
