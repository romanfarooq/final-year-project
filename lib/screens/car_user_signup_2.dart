import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../models/car_info.dart';

class CarUserSignup2 extends StatefulWidget {
  const CarUserSignup2({super.key});

  @override
  State<CarUserSignup2> createState() => _CarUserSignupState();
}

class _CarUserSignupState extends State<CarUserSignup2> {
  late String _selectedFuelType;
  final List<String> fuelTypes = ['Petrol', 'Diesel', 'Electric', 'Hybrid'];
  final TextEditingController _licensePlateController = TextEditingController();
  final TextEditingController _vinController = TextEditingController();
  final TextEditingController _mileageController = TextEditingController();
  bool _isNewCar = true;

  @override
  void dispose() {
    _licensePlateController.dispose();
    _vinController.dispose();
    _mileageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _selectedFuelType = fuelTypes.first;
  }

  @override
  Widget build(BuildContext context) {
    final carInfo = context.read<UserCarsInfo>();
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    final String manufacturer = args['manufacturer'];
    final String model = args['model'];
    final int year = args['year'];
    final Color color = args['color'];
    final String image = args['image'];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: figmaSpaceToPercentageWidth(35, context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: figmaSpaceToPercentage(55, context),
                ),
                Center(
                  child: Image.asset(
                    ImageConstant.carcare1,
                    height: 29,
                    width: 106,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(50, context),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: figmaSpaceToPercentageWidth(15, context),
                  ),
                  child: Text(
                    "License Plate Number:",
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(20, context),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(5, context),
                ),
                Container(
                  width: figmaSpaceToPercentageWidth(352, context),
                  height: figmaSpaceToPercentage(65, context),
                  padding: EdgeInsets.only(
                    left: figmaSpaceToPercentageWidth(26, context),
                    top: figmaSpaceToPercentage(2, context),
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(66, 84, 164, 0.49),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: TextField(
                    controller: _licensePlateController,
                    decoration: InputDecoration(
                      hintText: "LEV-8852",
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(50, 50, 50, 0.6),
                        fontSize: figmaSpaceToPercentage(20, context),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(20, context),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(15, context),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: figmaSpaceToPercentageWidth(15, context),
                  ),
                  child: Text(
                    "VIN (Vehicle Identification Number):",
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(20, context),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(5, context),
                ),
                Container(
                  width: figmaSpaceToPercentageWidth(352, context),
                  height: figmaSpaceToPercentage(65, context),
                  padding: EdgeInsets.only(
                    left: figmaSpaceToPercentageWidth(26, context),
                    top: figmaSpaceToPercentage(2, context),
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(66, 84, 164, 0.49),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: TextField(
                    controller: _vinController,
                    decoration: InputDecoration(
                      hintText: "4Y1SL65848Z411439",
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(50, 50, 50, 0.6),
                        fontSize: figmaSpaceToPercentage(20, context),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(20, context),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(15, context),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: figmaSpaceToPercentageWidth(10, context),
                  ),
                  child: Text(
                    "Fuel Type:",
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(20, context),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(5, context),
                ),
                DropdownMenu<String>(
                  width: figmaSpaceToPercentageWidth(352, context),
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: figmaSpaceToPercentage(20, context),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                  initialSelection: fuelTypes.first,
                  trailingIcon: Transform.rotate(
                    angle: 1.5,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 0.0,
                    ),
                    fillColor: const Color.fromRGBO(66, 84, 164, 0.49),
                    iconColor: Colors.black,
                    hoverColor: const Color.fromRGBO(66, 84, 164, 1),
                    filled: true,
                    isDense: true,
                    constraints: BoxConstraints.tight(
                      Size.fromHeight(figmaSpaceToPercentage(65, context)),
                    ),
                    focusColor: const Color.fromRGBO(66, 84, 164, 1),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(66, 84, 164, 1),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  dropdownMenuEntries: fuelTypes.map(
                    (String fuel) {
                      return DropdownMenuEntry<String>(
                        style: ButtonStyle(
                          textStyle: WidgetStateProperty.all<TextStyle>(
                            TextStyle(
                              color: const Color.fromRGBO(50, 50, 50, 0.6),
                              fontSize: figmaSpaceToPercentage(15, context),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all<Color>(
                            const Color.fromRGBO(66, 84, 164, 0.49),
                          ),
                        ),
                        value: fuel,
                        label: fuel,
                      );
                    },
                  ).toList(),
                  onSelected: (String? selectedItem) {
                    setState(() {
                      _selectedFuelType = selectedItem!;
                    });
                  },
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(15, context),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: figmaSpaceToPercentageWidth(15, context),
                  ),
                  child: Text(
                    "Milage:",
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(20, context),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(5, context),
                ),
                Container(
                  width: figmaSpaceToPercentageWidth(352, context),
                  height: figmaSpaceToPercentage(65, context),
                  padding: EdgeInsets.only(
                    left: figmaSpaceToPercentageWidth(26, context),
                    top: figmaSpaceToPercentage(2, context),
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(66, 84, 164, 0.49),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: TextField(
                    controller: _mileageController,
                    decoration: InputDecoration(
                      hintText: "1L/ 12 km",
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(50, 50, 50, 0.6),
                        fontSize: figmaSpaceToPercentage(20, context),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(20, context),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentageWidth(5, context),
                ),
                SwitchListTile(
                  title: Text(
                    "Is this a new car?",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: figmaSpaceToPercentage(20, context),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: figmaSpaceToPercentage(10, context),
                    right: figmaSpaceToPercentage(15, context),
                  ),
                  value: _isNewCar,
                  onChanged: (bool value) {
                    setState(() {
                      _isNewCar = value;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_licensePlateController.text.isEmpty ||
                        _vinController.text.isEmpty ||
                        _mileageController.text.isEmpty) {
                      return;
                    }
                    carInfo.addCar(
                      CarInfo(
                        manufacturer: manufacturer,
                        model: model,
                        licensePlate: _licensePlateController.text.trim(),
                        fuelType: _selectedFuelType,
                        color: color,
                        year: year,
                        mileage: double.parse(_mileageController.text.trim()),
                        vin: _vinController.text.trim(),
                        imgPath: image,
                        // imgPath: "assets/images/carlogo/Honda_CR-V.jpg",
                      ),
                    );
                    if (_isNewCar) {
                      Navigator.of(context).pushNamed(
                        AppRoutes.carFeatures,
                        arguments: _licensePlateController.text.trim(),
                      );
                    } else {
                      Navigator.of(context).pushNamed(
                        AppRoutes.oldCarInformation,
                        arguments: _licensePlateController.text.trim(),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(96, 189, 52, 1),
                    padding: EdgeInsets.symmetric(
                      vertical: figmaSpaceToPercentage(10, context),
                      horizontal: figmaSpaceToPercentageWidth(30, context),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: Size(
                      figmaSpaceToPercentageWidth(93, context),
                      figmaSpaceToPercentage(40, context),
                    ),
                  ),
                  child: const Text(
                    "Next",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(10, context),
                ),
                Center(
                  child: Image.asset(
                    image,
                    height: figmaSpaceToPercentage(170, context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
