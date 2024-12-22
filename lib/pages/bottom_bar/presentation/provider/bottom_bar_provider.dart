import 'package:flutter/material.dart';
import 'package:your_ears_app/pages/calender/presentation/screens/calender.dart';
import 'package:your_ears_app/pages/contact_screen/presentation/screen/contact_screen.dart';
import 'package:your_ears_app/pages/home/presentation/screens/home.dart';
import 'package:your_ears_app/pages/profile/presentation/screens/profile.dart';

class BottomBarProvider with ChangeNotifier {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CalenderScreen(),
    const ContactScreen(),
    const ProfileScreen(),
  ];

  int get selectedIndex => _selectedIndex;
  Widget get currentScreen => _screens[_selectedIndex];

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
