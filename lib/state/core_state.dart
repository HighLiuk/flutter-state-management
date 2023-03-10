import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provider = ChangeNotifierProvider((ref) => CoreState());

class CoreState extends ChangeNotifier {
  int _count = 0;

  int get counter => _count;

  void incrementCounter() {
    _count++;

    notifyListeners();
  }
}
