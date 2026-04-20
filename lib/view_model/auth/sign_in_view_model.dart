import 'package:auth_api_integration/models/sign_in_user_model.dart';
import 'package:auth_api_integration/repository/auth/auth_repository.dart';
import 'package:auth_api_integration/res/utils/custom_snack_bar.dart';
import 'package:auth_api_integration/res/validations/auth_validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/local/auth_local.dart';
import 'auth_view_model.dart';

class SignInViewModel extends ChangeNotifier {
  final TextEditingController usernameCtl = TextEditingController();
  final TextEditingController passCtl = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void clear() {
    usernameCtl.clear();
    passCtl.clear();
  }

  void setLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  void signIn(BuildContext context) async {
    final error = AuthValidation.signInValidation(
      username: usernameCtl.text,
      pass: passCtl.text,
    );

    if (error != null) {
      CustomSnackBar.showError(message: error, icon: Icons.error);
      return;
    }

    SignInUserModel body = SignInUserModel(
      username: usernameCtl.text,
      pass: passCtl.text,
    );

    try {
      setLoading(true);
      final response = await AuthRepository.signIn(body);
      await AuthLocal.saveSession(response);

      context.read<AuthViewModel>().loadUser();
      clear();

      notifyListeners();
    } catch (e) {
      CustomSnackBar.showError(message: e.toString(), icon: Icons.error);
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    usernameCtl.dispose();
    passCtl.dispose();
    super.dispose();
  }
}
