import 'package:flutter/material.dart';
import 'package:inherited_widget/counter/counter.dart';
import 'package:inherited_widget/state/state_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StateWidget(
      child: MaterialApp(
        title: 'InheritedWidget Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Counter(),
      ),
    );
  }
}
