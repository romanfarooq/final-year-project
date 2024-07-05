import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/car_care_requests.dart';
import '../screens/vehicle_service_record.dart';
import './workshop_homepage.dart';
import './workshop_services.dart';

class WorkshopBottomTabs extends StatefulWidget {
  const WorkshopBottomTabs({super.key});
  @override
  State<WorkshopBottomTabs> createState() => _WorkshopBottomTabsState();
}

class _WorkshopBottomTabsState extends State<WorkshopBottomTabs> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const WorkshopHomepage(),
    const CarCareRequests(),
    const WorkshopServices(),
    const VehicleServicRecord(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 0
                  ? 'assets/icons/home-bold.svg'
                  : 'assets/icons/home-outline.svg',
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 1
                  ? 'assets/icons/search-bold.svg'
                  : 'assets/icons/search-outline.svg',
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 2
                  ? 'assets/icons/add-square-bold.svg'
                  : 'assets/icons/add-square-outline.svg',
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 3 ? Icons.car_crash : Icons.car_crash_outlined,
              size: 30,
              color: const Color.fromARGB(150, 0, 0, 0),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
