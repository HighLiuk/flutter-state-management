import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inherited_widget/state/core_state.dart';
import 'package:inherited_widget/state/provider.dart';

class Display extends ConsumerWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CoreState state = ref.watch(provider);

    return Text(
      '${state.counter}',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
