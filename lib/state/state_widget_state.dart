import 'package:flutter/material.dart';
import 'package:inherited_widget/state/state_inherited_widget.dart';
import 'package:inherited_widget/state/state_widget.dart';

class StateWidgetState extends State<StateWidget> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateInheritedWidget(
      counter: counter,
      state: this,
      child: widget.child,
    );
  }
}
