import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final layoutCNP = ChangeNotifierProvider<LayoutChangeNotifier>((ref) {
  return LayoutChangeNotifier();
});

final addProjLayoutCNP = ChangeNotifierProvider<LayoutChangeNotifier>((ref) {
  return LayoutChangeNotifier();
});

final editProjLayoutCNP = ChangeNotifierProvider<LayoutChangeNotifier>((ref) {
  return LayoutChangeNotifier();
});

class LayoutChangeNotifier extends ChangeNotifier {
  bool _navigationVisible = true;
  int _pageKey = 0;

  bool get navigationVisble => _navigationVisible;
  int get pageKey => _pageKey;

  void updateNavigationVisible() {
    _navigationVisible = !_navigationVisible;
    notifyListeners();
  }

  void updatePageKey(int value) {
    _pageKey = value;
    notifyListeners();
  }
}
