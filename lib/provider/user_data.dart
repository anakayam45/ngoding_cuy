import 'package:flutter/material.dart';

import '../main.dart';

class Userdata extends ChangeNotifier {
  String _name = "";
  String? get name => _name;
  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  List<String>? _score;
  List<String>? get score => _score;
  void setScore(String value) {
    _score?.add(value);
    notifyListeners();
  }

  List<String>? _courseIds;
  List<String>? get courseIds => _courseIds;
  void setCourseIds(String value) {
    prefs!.setStringList("haaaaaaaa", _courseIds!);
    _courseIds?.add(value);
    notifyListeners();
  }
}
