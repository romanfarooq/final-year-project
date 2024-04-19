import 'package:provider/provider.dart';

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
      name: "BNW",
      licensePlate: "4321",
      imgPath: 'assets/images/carlogo/Honda_CR-V.jpg',
    ),
  ];

  get getCars => _userCars;

  set addCar(CarInfo car) {
    _userCars.add(car);
    notifyListeners();
  }

  void removeCar(CarInfo car) {
    _userCars.removeWhere((element) => element.licensePlate == car.licensePlate);
  }

  set updateCar(CarInfo car) {
    _userCars.removeWhere((element) => element.licensePlate == car.licensePlate);
    _userCars.add(car);
  }

  CarInfo getCarByLicensePlate(String licensePlate) {
    return _userCars
        .firstWhere((element) => element.licensePlate == licensePlate);
  }

  bool isCarExist(String licensePlate) {
    return _userCars.any((element) => element.licensePlate == licensePlate);
  }

  void removeAllCars() {
    _userCars.clear();
  }
}
