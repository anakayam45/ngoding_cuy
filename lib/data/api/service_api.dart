import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ngoding_cuy/data/model/materi_from_api.dart';

class ApiService {
  static const String _domain = "https://ngoding.ayam45.shop/";
  static const String _path = "api.php";
  static const String _apikey = "?api_key=1945";

  Future<NgodingCuy> availableCourse() async {
    print("api service start");
    try {
      final res = await http
          .get(Uri.parse("$_domain$_path$_apikey"))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw Exception("Request timeout");
      });

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
