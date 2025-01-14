import 'package:flutter/material.dart';

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

  Map<String, List<Set<String>>>? _courseIds;
  Map<String, List<Set<String>>>? get courseIds => _courseIds;
  void setCourseIds(String id, String value) {
    _courseIds![id] = [<String>{}, <String>{}];
    _courseIds![id]![0].add(value);
    notifyListeners();
  }
}
