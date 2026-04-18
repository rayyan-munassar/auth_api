import 'package:auth_api_integration/repository/auth/auth_repository.dart';
import 'package:auth_api_integration/res/utils/custom_snack_bar.dart';
import 'package:auth_api_integration/res/validations/auth_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class SignUpViewModel extends ChangeNotifier {
  final TextEditingController usernameCtl = TextEditingController();
  final TextEditingController emailCtl = TextEditingController();
  final TextEditingController passCtl = TextEditingController();
  final TextEditingController confirmPassCtl = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void clear() {
    usernameCtl.clear();
    emailCtl.clear();
    passCtl.clear();
    confirmPassCtl.clear();
  }

  void signUp(BuildContext context) async {
    final error = AuthValidator.signUpValidation(
      username: usernameCtl.text,
      email: emailCtl.text,
      pass: passCtl.text,
      confirmPass: confirmPassCtl.text,
    );

    if (error != null) {
      CustomSnackBar.showError(message: error, icon: Icons.info_rounded);
      return;
    }
    final String id = Uuid().v4();
    final body = {
      "id": id,
      "username": usernameCtl.text,
      "email": emailCtl.text,
      "password": passCtl.text,
    };

    try {
      _setLoading(true);
      final response = await AuthRepository.register(body);
      clear();
      Get.back();
      CustomSnackBar.showSuccess(
        message: "User created: ${response["username"]}",
        icon: Icons.check,
      );
    } catch (e) {
      CustomSnackBar.showError(message: e.toString(), icon: Icons.info_rounded);
      throw Exception(e);
    } finally {
      _setLoading(false);
    }
  }

  @override
  void dispose() {
    usernameCtl.dispose();
    emailCtl.dispose();
    passCtl.dispose();
    confirmPassCtl.dispose();
    super.dispose();
  }
}
