import 'package:flutter/material.dart';
import 'package:inherited_widget/state/state_widget_state.dart';

class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({
    super.key,
    required this.child,
  });

  @override
  State<StateWidget> createState() => StateWidgetState();
}
