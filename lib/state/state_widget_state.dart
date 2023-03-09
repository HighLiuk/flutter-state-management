import 'package:flutter/material.dart';
import 'package:inherited_widget/state/core_state.dart';
import 'package:inherited_widget/state/state_inherited_widget.dart';
import 'package:inherited_widget/state/state_widget.dart';

class StateWidgetState extends State<StateWidget> {
  CoreState state = const CoreState();

  void incrementCounter() {
    setState(() {
      state = state.copy(
        counter: state.counter + 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateInheritedWidget(
      state: state,
      stateWidget: this,
      child: widget.child,
    );
  }
}
