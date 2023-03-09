import 'package:flutter/material.dart';
import 'package:inherited_widget/state/state_inherited_widget.dart';
import 'package:inherited_widget/state/state_widget_state.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  StateWidgetState get provider => StateInheritedWidget.of(context);

  void _incrementCounter() {
    provider.incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
