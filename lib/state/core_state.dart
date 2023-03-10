import 'package:flutter/material.dart';

class CoreState extends ChangeNotifier {
  int _count = 0;

  int get counter => _count;

  void incrementCounter() {
    _count++;

    notifyListeners();
  }
}
