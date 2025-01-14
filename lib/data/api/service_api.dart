import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/materi_ngoding_cuy.dart';

class ApiService {
  static const String domain = "https://ngoding.ayam45.shop";

  Future<NgodingCuy> availableCourse() async {
    const String url = "$domain/api.php?api_key=1945";
    try {
      final res =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      if (res.statusCode == 200) {
        return NgodingCuy.fromJson(json.decode(res.body));
      } else {
        throw Exception("HTTP Error: ${res.statusCode}");
      }
    } on Exception catch (e) {
      throw Exception("Error fetching courses: $e");
    }
  }

  Future<Map<String, dynamic>> login(String email, String pass) async {
    String encodedPass = base64Encode(utf8.encode(pass));
    const String url = "$domain/login.php";

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {'login': '1', 'email': email, 'pass': encodedPass},
      ).timeout(const Duration(seconds: 10));

      final result = json.decode(response.body);

      if (result["status"] != "error") {
        return result;
      } else {
        throw Exception(result['message']);
      }
    } catch (e) {
      throw Exception("Login error: $e");
    }
  }

  Future<String> register(String user, String email, String pass) async {
    String encodedPass = base64Encode(utf8.encode(pass));
    const String url = "$domain/login.php";
    print("Mengirim data...");

    try {
      final res = await http.post(
        Uri.parse(url),
        body: {
          'regis': '1',
          'username': user,
          'email': email,
          'pass': encodedPass,
        },
      ).timeout(const Duration(seconds: 10)); // Kurangi timeout jika perlu

      if (res.statusCode == 200) {
        final Map<String, dynamic> response = json.decode(res.body);

        if (response["status"] == "success") {
          print("Registrasi berhasil: ${response['message']}");
          return response['message'];
        } else {
          throw Exception("Gagal registrasi: ${response['message']}");
        }
      } else {
        throw Exception("HTTP Error: ${res.statusCode}");
      }
    } catch (e) {
      print("Error saat registrasi: $e");
      throw Exception("Register error: $e");
    }
  }
}
