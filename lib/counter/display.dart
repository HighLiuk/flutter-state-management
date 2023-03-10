import 'package:flutter/material.dart';
import 'package:inherited_widget/state/core_state.dart';
import 'package:provider/provider.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CoreState>(
      builder: (context, state, child) {
        return Text(
          '${state.counter}',
          style: Theme.of(context).textTheme.headlineMedium,
        );
      },
    );
  }
}
