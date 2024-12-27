import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/model/materi_from_api.dart';

class CourseProvider extends ChangeNotifier {
  NgodingCuy? _course;

  NgodingCuy? get course => _course;

  void addCourse(json) {
    _course = json;
    notifyListeners();
  }

  List<CourseName> getCourseData() {
    if (_course != null) {
      return _course!.data.courses;
    }
    return [];
  }

  List<News> getNewsData() {
    if (_course != null) {
      return _course!.data.news;
    }
    return [];
  }

  List<CourseName> getSelectedCourse() {
    if (_course != null) {
      return _course!.data.courses.where((x) => x.selected).toList();
    }
    return [];
  }

  void selectingCourse(String id) {
    if (_course != null) {
      for (var course in _course!.data.courses) {
        if (course.id == id) {
          course.selected = true;
        }
      }
      notifyListeners();
    }
  }
}
