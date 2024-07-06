import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../routes/app_routes.dart';
import './car_user_explor.dart';
import './car_user_main_page.dart';
import './user_homescreen.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({super.key});
  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const CarUserMain(),
    const Explore(),
    Container(
      color: Colors.white,
    ),
    const UserHomeScreen(),
    // Container(
    //   color: Colors.white,
    // ),
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

          if (index == 2) {
            Navigator.of(context).pushNamed(AppRoutes.carUserSignup);
            return;
          }
          // if (index == 4) {
          //   Navigator.of(context).pushNamed(AppRoutes.accountSettings);
          //   return;
          // }
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
          // const BottomNavigationBarItem(
          //   icon: Icon(
          //     size: 30,
          //     color: Color.fromARGB(150, 0, 0, 0),
          //     Icons.settings_outlined,
          //   ),
          //   label: '',
          // ),
        ],
      ),
    );
  }
}
