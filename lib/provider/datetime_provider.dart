import 'package:flutter/material.dart';

class TimeProvider with ChangeNotifier {
  TimeOfDay? _selectedTime;

  TimeOfDay? get selectedTime => _selectedTime;

  void setSelectedTime(TimeOfDay time) {
    _selectedTime = time;
    print(_selectedTime);
    notifyListeners();
  }
}
