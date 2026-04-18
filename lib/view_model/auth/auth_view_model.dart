import 'package:auth_api_integration/data/local/auth_local.dart';
import 'package:auth_api_integration/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoggedIn => _user != null;

  Future<void> loadUser() async {
    setLoading(true);
    _user = AuthLocal.user;
    setLoading(false);
  }

  void logout() {
    AuthLocal.clear();
    _user = null;
    notifyListeners();
  }
}
