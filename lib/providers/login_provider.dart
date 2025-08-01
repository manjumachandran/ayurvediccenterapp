
import 'package:flutter/material.dart';
import 'package:machne_test/services/login_services.dart';


class LoginProvider with ChangeNotifier {
  String? _token;
  bool _isLoading = false;

  String? get token => _token;
  bool get isLoading => _isLoading;

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    final loginService = LoginService();
    final result = await loginService.login(username, password);

    _isLoading = false;

    if (result != null) {
      _token = result;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
