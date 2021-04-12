import 'package:apex_weapons/helpers/enums.dart';
import 'package:flutter/cupertino.dart';

class AppStateNotifier extends ChangeNotifier {
  AppState _state = AppState.Idle;
  AppState get state => _state;

  void setState(AppState appState) {
    _state = appState;
    notifyListeners();
  }

  bool _hasError = false;
  bool get hasError => _hasError;

  void updateHasError({bool value}) {
    _hasError = value;
    notifyListeners();
  }
}
