import 'package:auth_api_integration/models/user_model.dart';
import 'package:hive_flutter/adapters.dart';

class AuthLocal {
  static final box = Hive.box("auth");

  static Future<void> saveSession(Map<String, dynamic> body) async {
    await box.put("accessToken", body["accessToken"]);
    await box.put("refreshToken", body["refreshToken"]);
    await box.put(
      "user",
      UserModel(
        id: body["id"],
        username: body["username"],
        email: body["email"],
        firstName: body["firstName"],
        lastName: body["lastName"],
        gender: body["gender"],
        image: body["image"],
      ).toJson(),
    );
  }

  static String? get token => box.get("accessToken");

  static UserModel? get user {
    final data = box.get("user");
    if (data == null) return null;
    return UserModel.fromJson(Map<String, dynamic>.from(data));
  }

  static bool get isLoggedIn => user != null;

  static Future<void> clear() async {
    box.clear();
  }
}
