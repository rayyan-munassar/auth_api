import 'package:get/get.dart';

class AuthValidator {
  static String? signUpValidation({
    required String username,
    required String email,
    required String pass,
    required String confirmPass,
  }) {
    if (username.trim().isEmpty) {
      return "Username is required";
    } else if (email.trim().isEmpty) {
      return "Email is required";
    } else if (!GetUtils.isEmail(email)) {
      return "Enter valid email";
    } else if (pass.isEmpty) {
      return "Password is required";
    } else if (confirmPass.isEmpty) {
      return "Confirm password is required";
    } else if (pass != confirmPass) {
      return "Confirm password and password should match";
    }

    return null;
  }

  static String? signInValidator({
    required String username,
    required String password,
  }) {
    if (username.trim().isEmpty) {
      return "Enter your username";
    } else if (password.trim().isEmpty) {
      return "Enter your password";
    }
    return null;
  }
}
