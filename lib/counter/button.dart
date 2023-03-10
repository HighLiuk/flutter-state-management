import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inherited_widget/state/core_state.dart';

class Button extends ConsumerWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CoreState state = ref.read(provider.notifier);

    return FloatingActionButton(
      onPressed: state.incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
