import 'package:flutter/material.dart';
import 'package:inherited_widget/state/state_widget_state.dart';

class StateInheritedWidget extends InheritedWidget {
  final int counter;
  final StateWidgetState state;

  const StateInheritedWidget({
    super.key,
    required this.counter,
    required this.state,
    required super.child,
  });

  static StateWidgetState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!
        .state;
  }

  @override
  bool updateShouldNotify(StateInheritedWidget oldWidget) {
    return counter != oldWidget.counter;
  }
}
