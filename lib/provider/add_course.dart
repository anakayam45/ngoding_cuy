import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/model/materi_from_api.dart';

class CourseProvider extends ChangeNotifier {
  NgodingCuy? _course;

  NgodingCuy? get course => _course;

  void addCourse(json) {
    _course = json;
    notifyListeners();
  }
}
