import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../utils/toast_message.dart';
import '../widgets/custom_elevated_button.dart';
import '../models/car_info.dart';

class BookingService extends StatefulWidget {
  const BookingService({super.key});

  @override
  State<BookingService> createState() => _BookingServiceState();
}

class _BookingServiceState extends State<BookingService> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  ToastMessage toast = ToastMessage();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      // Check if the selected date is today and time is not in the past
      if (selectedDate.day == DateTime.now().day &&
          picked.hour < TimeOfDay.now().hour) {
        toast.toastmessage(
          "Please select a time in the future",
        );
        return;
      }
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Text(
                'Booking',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: figmaSpaceToPercentageHeight(50, context),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      top: figmaSpaceToPercentageHeight(10, context),
                    ),
                    child: const Text(
                      'Select Date:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: figmaSpaceToPercentageHeight(20, context),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: figmaSpaceToPercentageHeight(20, context),
                        horizontal: figmaSpaceToPercentageWidth(15, context),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('yyyy-MM-dd').format(selectedDate),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                            const Icon(
                              Icons.calendar_today,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentageHeight(50, context),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Select Time:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectTime(context),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: figmaSpaceToPercentageHeight(20, context),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: figmaSpaceToPercentageHeight(20, context),
                        horizontal: figmaSpaceToPercentageWidth(15, context),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedTime.format(context),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                            const Icon(
                              Icons.access_time,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: figmaSpaceToPercentageHeight(50, context),
                  ),
                ],
              ),
            ),
            CustomElevatedButton(
              text: "Confirm",
              buttonStyle: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(
                    vertical: figmaSpaceToPercentageHeight(20, context),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all<Color>(
                  Colors.transparent,
                ),
                elevation: WidgetStateProperty.all<double>(0),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  figmaSpaceToPercentageHeight(5, context),
                ),
                gradient: LinearGradient(
                  begin: const Alignment(0.5, 0),
                  end: const Alignment(0.5, 1),
                  colors: [
                    const Color(0XFF6E7CB9),
                    Theme.of(context).colorScheme.primary,
                  ],
                ),
              ),
              onPressed: () {
                DateTime selectedDateTime = DateTime(
                  selectedDate.year,
                  selectedDate.month,
                  selectedDate.day,
                  selectedTime.hour,
                  selectedTime.minute,
                );
                context.read<UserCarsInfo>().setBookingDate(selectedDateTime);
                Navigator.of(context).pushNamed(
                  AppRoutes.carUserExplor,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

AppBar appBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(10),
      child: Image.asset(ImageConstant.carcare1, height: 25),
    ),
    actions: [
      Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(217, 217, 217, 0.5),
          borderRadius: BorderRadius.circular(48),
          shape: BoxShape.rectangle,
        ),
        margin: const EdgeInsets.only(right: 10, top: 5),
        width: 60,
        height: 38,
        child: IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
      ),
    ],
  );
}
