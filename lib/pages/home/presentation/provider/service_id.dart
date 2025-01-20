import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package for formatting

class ServiceProvider with ChangeNotifier {
  int? _serviceId;
  String? _startTime;
  String? _endTime;

  int? get serviceId => _serviceId;
  String? get startTime => _startTime;
  String? get endTime => _endTime;

  void setServiceId(int id) {
    _serviceId = id;
    notifyListeners();
  }

  void setStartTime(String startTime) {
    _startTime = startTime;
    notifyListeners();
  }

  void setEndTime(String endTime) {
    _endTime = endTime;
    notifyListeners();
  }
}
