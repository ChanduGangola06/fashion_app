import 'package:flutter/foundation.dart';

class TabIndexProvider extends ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  void setIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
