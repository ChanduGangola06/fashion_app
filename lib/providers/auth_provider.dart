import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _password = true;
  bool get password => _password;

  void setPassword() {
    _password = !_password;
    notifyListeners();
  }

  void login() async {
    try {
      _isLoading = true;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }
}
