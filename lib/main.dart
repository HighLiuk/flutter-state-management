import 'package:flutter/material.dart';
import 'package:inherited_widget/counter/counter.dart';
import 'package:inherited_widget/state/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Counter(),
      ),
    );
  }
}
