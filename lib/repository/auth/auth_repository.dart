import 'dart:convert';

import 'package:auth_api_integration/models/add_user_model.dart';
import 'package:auth_api_integration/models/sign_in_user_model.dart';
import 'package:auth_api_integration/res/app_url.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  static Future<dynamic> signUp(AddUserModel body) async {
    final url = Uri.parse(AppUrl.signUp);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body.toJson()),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return data;
      } else {
        throw Exception("Network Error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> signIn(SignInUserModel body) async {
    final url = Uri.parse(AppUrl.signIn);

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": "emilys",
          "password": "emilyspass",
          "expiresInMins": 30,
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception("Network Error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
