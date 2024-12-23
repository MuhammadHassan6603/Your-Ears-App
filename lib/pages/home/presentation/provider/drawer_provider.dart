import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier {
  int _selectedIndex = -1; // No selection initially

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
