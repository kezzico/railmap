import 'package:flutter/material.dart';

enum Screen {
  Home,
  Profile,
  Settings,
}

class RootWidgetState extends ChangeNotifier {
  Screen _currentScreen = Screen.Home;

  Screen get currentScreen => _currentScreen;

  double _bottomWidgetHeight = 0;

  void changeScreen(Screen newScreen) {
    _currentScreen = newScreen;
    notifyListeners();
  }

  void setBottomWidgetHeight(double height) {
    _bottomWidgetHeight = height;
    notifyListeners();
  }

  double getBottomWidgetHeight() {
    return _bottomWidgetHeight;
  }
}
