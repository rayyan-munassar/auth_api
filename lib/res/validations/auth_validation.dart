import 'package:get/get.dart';

class AuthValidation {
  static String? signUpValidation({
    required String username,
    required String email,
    required String pass,
    required String confirmPass,
  }) {
    if (username.isEmpty) {
      return "Username is required";
    } else if (email.isEmpty) {
      return "Email is required";
    } else if (!GetUtils.isEmail(email)) {
      return "Enter valid email";
    } else if (pass.isEmpty) {
      return "Password is required";
    } else if (confirmPass.isEmpty) {
      return "Confirm password is required";
    } else if (pass != confirmPass) {
      return "Password and confirm password should match";
    } else {
      return null;
    }
  }

  static String? signInValidation({
    required String username,
    required String pass,
  }) {
    if (username.isEmpty) {
      return "Username is required";
    } else if (pass.isEmpty) {
      return "pass is required";
    } else {
      return null;
    }
  }
}
