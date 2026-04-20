import 'package:auth_api_integration/models/add_user_model.dart';
import 'package:auth_api_integration/repository/auth/auth_repository.dart';
import 'package:auth_api_integration/res/utils/custom_snack_bar.dart';
import 'package:auth_api_integration/res/validations/auth_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpViewModel extends ChangeNotifier {
  final TextEditingController usernameCtl = TextEditingController();
  final TextEditingController emailCtl = TextEditingController();
  final TextEditingController passCtl = TextEditingController();
  final TextEditingController confirmPassCtl = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  void clear() {
    usernameCtl.clear();
    emailCtl.clear();
    passCtl.clear();
    confirmPassCtl.clear();
  }

  @override
  void dispose() {
    usernameCtl.dispose();
    emailCtl.dispose();
    passCtl.dispose();
    confirmPassCtl.dispose();
    super.dispose();
  }

  void signUp() async {
    String? error = AuthValidation.signUpValidation(
      username: usernameCtl.text,
      email: emailCtl.text,
      pass: passCtl.text,
      confirmPass: confirmPassCtl.text,
    );

    if (error != null) {
      CustomSnackBar.showError(message: error, icon: Icons.error);
      return;
    }
    try {
      setLoading(true);
      AddUserModel body = AddUserModel(
        username: usernameCtl.text,
        email: emailCtl.text,
        password: passCtl.text,
      );
      final response = await AuthRepository.signUp(body);
      clear();
      Get.back();
      CustomSnackBar.showSuccess(
        message: "Account was created: ${response["username"]}",
        icon: Icons.check,
      );
    } catch (e) {
      throw Exception(e);
    } finally {
      setLoading(false);
    }
  }
}
