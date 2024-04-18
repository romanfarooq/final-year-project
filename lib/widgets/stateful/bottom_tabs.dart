import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({ Key? key }) : super(key: key);

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  
  int _selectedIndex = 0;
  
  final List<Widget> _pages = [
    Container(color: Colors.red,),
    Container(color: Colors.blue,),
    Container(color: Colors.green,),
    Container(color: Colors.purple,),
    Container(color: Colors.yellow,),
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
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_selectedIndex == 0 ? 'assets/icons/home-bold.svg' :'assets/icons/home-outline.svg'),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_selectedIndex == 1 ? 'assets/icons/search-bold.svg' :'assets/icons/search-outline.svg'),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_selectedIndex == 2 ? 'assets/icons/add-square-bold.svg' : 'assets/icons/add-square-outline.svg'),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(_selectedIndex == 3 ? 'assets/icons/video-play-bold.svg' : 'assets/icons/video-play-outline.svg'),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/profile.png')),
                shape: BoxShape.circle
              ),
            ),
            label: ''
          ),
        ],
      ),
    );
  }
}