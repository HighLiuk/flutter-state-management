import 'package:flutter/material.dart';
import 'package:inherited_widget/state/core_state.dart';
import 'package:inherited_widget/state/state_widget_state.dart';

class StateInheritedWidget extends InheritedWidget {
  final CoreState state;
  final StateWidgetState stateWidget;

  const StateInheritedWidget({
    super.key,
    required this.state,
    required this.stateWidget,
    required super.child,
  });

  static StateWidgetState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!
        .stateWidget;
  }

  @override
  bool updateShouldNotify(StateInheritedWidget oldWidget) {
    return state != oldWidget.state;
  }
}
