import 'package:flutter/material.dart';

class Userdata extends ChangeNotifier {
  String? _name;
  String? get name => _name;
  void setUserName(user) {
    _name = user;
    ChangeNotifier();
  }

  double? _score;
  double? get score => _score;
  void setNewScore(user) {
    _score = user;
    ChangeNotifier();
  }
}
