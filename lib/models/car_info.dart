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

class UserCarsInfo {
  final List<CarInfo> userCars = [
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

    get cars => userCars;

    set addCar(CarInfo car) {
        userCars.add(car);
    }

    void removeCar(CarInfo car) {
        userCars.removeWhere((element) => element.licensePlate == car.licensePlate);
    }

    set updateCar(CarInfo car) {
        userCars.removeWhere((element) => element.licensePlate == car.licensePlate);
        userCars.add(car);
    }

    CarInfo getCarByLicensePlate(String licensePlate) {
        return userCars.firstWhere((element) => element.licensePlate == licensePlate);
    }

    bool isCarExist(String licensePlate) {
        return userCars.any((element) => element.licensePlate == licensePlate);
    }
    void removeAllCars() {
        userCars.clear();
    }
}
