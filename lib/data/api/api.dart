import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ngoding_cuy/data/model/materi.dart';

class ApiService {
  static const String _domain = "http://localhost";
  static const String _path = "/upload/api.php";
  static const String _apikey = "?api_key=1945";

  Future<NgodingCuy> availableCourse() async {
    // print("$_domain$_path$_apikey");
    final res = await http.get(Uri.parse("$_domain$_path$_apikey"));

    if (res.statusCode == 200) {
      return NgodingCuy.fromJson(json.decode(res.body));
    } else {
      throw Exception("Network eyoy!");
    }
  }
}
