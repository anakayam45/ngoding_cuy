import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/model/materi_from_api.dart';

class CourseAppActifity extends ChangeNotifier {
  // model dasar > status, data
  NgodingCuy? _course;
  NgodingCuy? get course => _course;
  void addCourse(json) {
    _course = json;
    notifyListeners();
  } // menambahkan data dari service_api.dart

//

//

  // digunakan di popup_alert_dialog.dart
  // berfungsi untuk menyimpan course yang di pilih
  void setSelectingCourse(String id) {
    if (_course != null) {
      for (var course in _course!.data.courses) {
        if (course.id == id) {
          course.selected = true;
        }
      }
      notifyListeners();
    }
  }

//

//

  // digunakan di selection_page.dart
  // outpunya list materi yang sudah dipilih
  List<CourseName> getSelectedCourse() {
    if (_course != null) {
      return _course!.data.courses.where((x) => x.selected).toList();
    }
    return [];
  }

//

//

  // digunakan di home.dart
  // hasilnya list course yang tersedia
  List<CourseName> getCourseData() {
    if (_course != null) {
      return _course!.data.courses;
    }
    return [];
  } // output => [Course1, Course2, ...] dipakai home page

//

//

  // output nya Course yang dipilih di course_grid_tile.dat
  CourseName? _coursestate;
  CourseName? get coursestate => _coursestate;
  void setCourseState(course) {
    _coursestate = course;
    notifyListeners();
  } // misal output nya "Course1" dipakai untuk mencetak material di bawah

  List<Module> getCourseContent() {
    return _coursestate!.materials;
  } // output nya ["Penahuluan", "Penutup"]

//

//

  Module? _materialstate;
  Module? get materialstate => _materialstate;

  List<ModuleContent>? _materialcontent;
  List<ModuleContent>? get materialcontent => _materialcontent;

  List<Question>? _questionstate;
  List<Question>? get questionstate => _questionstate;

  void setMaterialContent(Module materi) {
    _materialstate = materi;
    _materialcontent = materi.materialContent;
    _questionstate = materi.questions;
    notifyListeners();
  } // menyimpan materi yang di klik. misal "penadahuluan", isi materi dan soal

//

//

  List<News> getNewsData() {
    if (_course != null) {
      return _course!.data.news;
    }
    return [];
  }
}
