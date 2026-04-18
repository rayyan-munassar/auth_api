import 'package:auth_api_integration/models/user_model.dart';
import 'package:hive_flutter/adapters.dart';

class AuthLocal {
  static final box = Hive.box("auth");

  static Future<void> saveSession(Map<String, dynamic> data) async {
    await box.put("accessToken", data["accessToken"]);
    await box.put("refreshToken", data["refreshToken"]);
    await box.put("user", {
      "id": data["id"],
      "email": data["email"],
      "firstName": data["firstName"],
      "lastName": data["lastName"],
      "gender": data["gender"],
      "image": data["image"],
    });
  }

  static String? get token => box.get("accessToken");

  static UserModel? get user {
    final data = box.get("user");

    if (data == null) return null;

    return UserModel.fromJson(Map<String, dynamic>.from(box.get("user")));
  }

  static bool get isLoggedIn => token != null;

  static Future<void> clear() async {
    box.clear();
  }
}
