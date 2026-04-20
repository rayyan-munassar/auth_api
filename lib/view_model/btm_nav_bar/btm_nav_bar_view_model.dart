import 'package:auth_api_integration/view/btm_nav_bar/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../view/btm_nav_bar/account/account_screen.dart';

class BtmNavBarViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> screens = const [
    HomeScreen(),
    Center(child: Text("Search")),
    Center(child: Text("Orders")),
    AccountScreen(),
  ];

  void setIndex(int i) {
    _currentIndex = i;
    notifyListeners();
  }
}
