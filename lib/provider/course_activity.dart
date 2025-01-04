import 'package:flutter/material.dart';
import 'package:ngoding_cuy/data/model/materi_from_api.dart';

class CourseAppActifity extends ChangeNotifier {
  // model dasar > status, data
  NgodingCuy? courseData;
  NgodingCuy? get course => courseData;
  void addCourse(json) {
    courseData = json;
    notifyListeners();
  } // nilainya model Ngodingcuy
  // memasukkan data dari service_api.dart

//

  // digunakan di popup_alert_dialog.dart
  void upDateSelectingCourseData(String id) {
    if (courseData != null) {
      for (var course in courseData!.data.courses) {
        if (course.id == id) {
          course.selected = true;
        }
      }
      notifyListeners();
    }
  } // mengubah nilai selected course di class Module jadi true

//

  // digunakan di selection_page.dart
  List<CourseName> get getSelectedCourseData =>
      courseData!.data.courses.where((x) => x.selected).toList();
  // output: Course1, Course2
  // yang nilai selected nya true

//

  // digunakan di home.dart
  List<CourseName> getCourseName() {
    if (courseData != null) {
      return courseData!.data.courses;
    }
    return [];
  } // output => [Course1, Course2, ...] dipakai home page
  // nama course yang dari api

//

//

  // nilai nya Course yang dipilih di selection_course.dat
  CourseName? courseNameState;
  CourseName? get coursestate => courseNameState;
  void setCourseNameState(course) {
    courseNameState = course;
    notifyListeners();
  } // misal output nya "Course1" dipakai untuk mencetak nama2 materi dibawah di bawah

  List<Module> getCourseContent() {
    return courseNameState!.materials;
  } // output: ["Penahuluan", "Penutup"]
  // jadi user tidak bisa mengakses 2 atau lebih materi karena yang disimpan hanya 1
  // disimpan hanya untuk jadi patokan bagi layar materialContent

//

//

  // sama kayak sebelumnya, menyimpan data materi yang di klik
  Module? _materialNameState; // ini untuk dijadikan patokan
  Module? get materialNamestate => _materialNameState;
  // contoh: Pendahuluan

  // ini mencetak semua konten materi yang ada di variabel _materialNameState
  List<ModuleContent>? _materialcontent;
  List<ModuleContent>? get materialcontent => _materialcontent;
  // contoh: paragraph1, paragraph2

  // ini mencetak semua pertanyaan per materi yang ada di variabel _materialNameState
  List<Question>? _questionstate;
  List<Question>? get questionstate => _questionstate;
  // contoh: soal1, soal2

  void setMaterialContent(Module materi) {
    _materialNameState = materi;
    _materialcontent = materi.materialContent;
    _questionstate = materi.questions;
    notifyListeners();
  } // menyimpan materi yang di klik. misal "Pendahuluan", isi materi dan soal

//

//

  News? _newsState;
  List<News> get getNewsData => course!.data.news;
  News? get newsSate => _newsState;
  void setNewsContent(News news) {
    _newsState = news;
  }
}
