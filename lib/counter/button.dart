import 'package:flutter/material.dart';
import 'package:inherited_widget/state/core_state.dart';
import 'package:inherited_widget/state/provider.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    final CoreState state = StateProvider.of(context);

    return FloatingActionButton(
      onPressed: state.incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
