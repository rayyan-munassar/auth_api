import 'dart:convert';

import 'package:auth_api_integration/res/app_url.dart';
import 'package:http/http.dart' hide Response;

class AuthRepository {
  static Future<dynamic> register(Map<String, dynamic> body) async {
    final url = Uri.parse(AppUrl.register);

    try {
      final response = await post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return data;
      } else {
        throw Exception("Registration failed");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }

  static Future<dynamic> signIn(Map<String, dynamic> body) async {
    final url = Uri.parse(AppUrl.login);

    try {
      final response = await post(
        url,
        headers: {"Content-Type": 'application/json'},
        body: jsonEncode({
          "username": "emilys",
          "password": "emilyspass",
        }), // I would replace it with body
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      } else {
        print(response.statusCode);
        throw Exception("Sign In failed");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }
}
