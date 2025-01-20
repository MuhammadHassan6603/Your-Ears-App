import 'package:flutter/material.dart';

class ServiceProvider with ChangeNotifier {
  int? _serviceId;

  int? get serviceId => _serviceId;

  void setServiceId(int id) {
    _serviceId = id;
    notifyListeners();
  }
}
