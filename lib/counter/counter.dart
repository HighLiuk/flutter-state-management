import 'package:flutter/material.dart';
import 'package:inherited_widget/counter/button.dart';
import 'package:inherited_widget/counter/display.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
      ),
      body: const Center(
        child: Display(),
      ),
      floatingActionButton: const Button(),
    );
  }
}
