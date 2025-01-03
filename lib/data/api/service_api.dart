import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ngoding_cuy/data/model/materi_from_api.dart';

class ApiService {
  static const String _domain = "http://10.0.2.2:8080";
  static const String _path = "/upload/api.php";
  static const String _apikey = "?api_key=1945";

  Future<NgodingCuy> availableCourse() async {
    print("api service start");
    try {
      final res = await http.get(Uri.parse("$_domain$_path$_apikey"));

      if (res.statusCode == 200) {
        print("api service finsih");
        return NgodingCuy.fromJson(json.decode(res.body));
      } else {
        print("api service cancel");
        throw Exception("Network eyoy!");
      }
    } catch (e) {
      print(e);
      throw Exception("Network eyoy!: $e");
    }
  }
}
