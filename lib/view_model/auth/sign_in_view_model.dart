import 'package:auth_api_integration/repository/auth/auth_repository.dart';
import 'package:auth_api_integration/res/utils/app_routes.dart';
import 'package:auth_api_integration/res/utils/custom_snack_bar.dart';
import 'package:auth_api_integration/res/validations/auth_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/local/auth_local.dart';

class SignInViewModel extends ChangeNotifier {
  final TextEditingController usernameCtl = TextEditingController();
  final TextEditingController passCtl = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void clear() {
    usernameCtl.clear();
    passCtl.clear();
  }

  void signIn() async {
    final error = AuthValidator.signInValidator(
      username: usernameCtl.text,
      password: passCtl.text,
    );

    if (error != null) {
      CustomSnackBar.showError(message: error, icon: Icons.error);
      return;
    }
    Map<String, dynamic> body = {
      "username": usernameCtl.text,
      "password": passCtl.text,
    };
    try {
      setLoading(true);
      final response = await AuthRepository.signIn(body);

      await AuthLocal.saveSession(response);

      clear();
      CustomSnackBar.showSuccess(
        message: "Login successful",
        icon: Icons.check,
      );
      Get.offAllNamed(AppRoutes.btmNavBar);
    } catch (e) {
      CustomSnackBar.showError(message: e.toString(), icon: Icons.error);
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    usernameCtl.dispose();
    passCtl.dispose();
  }
}
