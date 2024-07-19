import 'package:flutter/foundation.dart';

class OnboardingProvider extends ChangeNotifier {
  int _selectedPage = 0;
  int get selectedPage => _selectedPage;

  void setSelected(int page) {
    _selectedPage = page;
    notifyListeners();
  }
}
