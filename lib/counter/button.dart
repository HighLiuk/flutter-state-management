import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inherited_widget/state/provider.dart';

class Button extends ConsumerWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppStateNotifier state = ref.read(provider.notifier);

    return FloatingActionButton(
      onPressed: state.incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
