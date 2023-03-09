import 'package:flutter/material.dart';
import 'package:inherited_widget/state/state_inherited_widget.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  int get count => StateInheritedWidget.of(context).state.counter;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
