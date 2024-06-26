import 'package:flutter/material.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../models/car_data.dart';

class CarUserSignup extends StatefulWidget {
  const CarUserSignup({super.key});

  @override
  State<CarUserSignup> createState() => _CarUserSignupState();
}

class _CarUserSignupState extends State<CarUserSignup> {
  int? _selectedYear;
  String? _selectedManufacturer;
  String? _selectedModel;
  Color? _selectedColor = carColrs['Black'];
  List<String> _modelNames = carModels[carManufacturers.first] ?? [];

  void updateModelNames(String manufacturer) {
    setState(() {
      _selectedModel = null; // Reset selected model when manufacturer changes
      _modelNames = carModels[manufacturer] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  height: figmaSpaceToPercentage(64, context),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: figmaSpaceToPercentageWidth(15, context),
                  ),
                  child: Text(
                    "Manufacturer:",
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
                  initialSelection: carManufacturers.first,
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: figmaSpaceToPercentage(20, context),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
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
                  dropdownMenuEntries: carManufacturers.map(
                    (String name) {
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
                        value: name,
                        label: name,
                      );
                    },
                  ).toList(),
                  onSelected: (String? selectedItem) {
                    setState(() {
                      _selectedManufacturer = selectedItem;
                      updateModelNames(selectedItem!);
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
                    "Car Model:",
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
                  initialSelection: _modelNames.first,
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: figmaSpaceToPercentage(20, context),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
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
                  dropdownMenuEntries: _modelNames.map(
                    (String name) {
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
                        value: name,
                        label: name,
                      );
                    },
                  ).toList(),
                  onSelected: (String? selectedItem) {
                    setState(() {
                      _selectedModel = selectedItem;
                    });
                  },
                ),
                SizedBox(
                  height: figmaSpaceToPercentage(15, context),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: figmaSpaceToPercentageWidth(10, context),
                  ),
                  child: Text(
                    "Year of Manufacture:",
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
                DropdownMenu<int>(
                  width: figmaSpaceToPercentageWidth(150, context),
                  textStyle: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: figmaSpaceToPercentage(20, context),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                  initialSelection: years['2024'],
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
                  dropdownMenuEntries: years.keys.map(
                    (String key) {
                      return DropdownMenuEntry<int>(
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
                        value: years[key]!,
                        label: key,
                      );
                    },
                  ).toList(),
                  onSelected: (int? selectedItem) {
                    setState(() {
                      _selectedYear = selectedItem;
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
                    "Color:",
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
                DropdownMenu<Color>(
                  width: figmaSpaceToPercentageWidth(352, context),
                  initialSelection: carColrs['Black'],
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: figmaSpaceToPercentage(20, context),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
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
                    fillColor: _selectedColor,
                    iconColor: Colors.black,
                    filled: true,
                    isDense: true,
                    constraints: BoxConstraints.tight(
                      Size.fromHeight(figmaSpaceToPercentage(65, context)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  dropdownMenuEntries: carColrs.keys.map(
                    (String color) {
                      return DropdownMenuEntry<Color>(
                        style: ButtonStyle(
                          textStyle: WidgetStateProperty.all<TextStyle>(
                            TextStyle(
                              color: Colors.white,
                              fontSize: figmaSpaceToPercentage(15, context),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all<Color>(
                            const Color.fromRGBO(66, 84, 164, 0.49),
                          ),
                        ),
                        value: carColrs[color]!,
                        label: color,
                      );
                    },
                  ).toList(),
                  onSelected: (Color? selectedItem) {
                    setState(() {
                      _selectedColor = selectedItem;
                    });
                  },
                ),
                SizedBox(
                  height: figmaSpaceToPercentageWidth(20, context),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_selectedManufacturer != null &&
                        _selectedModel != null &&
                        _selectedYear != null &&
                        _selectedColor != null) {
                      // Add your logic here
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
                    _selectedManufacturer != null
                        ? carManufacturersLogo[_selectedManufacturer!]!
                        : ImageConstant.audiLogo,
                    height: figmaSpaceToPercentage(200, context),
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
