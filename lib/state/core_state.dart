import 'package:inherited_widget/state/persist.dart';

class CoreState {
  final int counter;

  CoreState({
    this.counter = 0,
  });

  CoreState copy({
    int? counter,
  }) {
    final CoreState state = CoreState(
      counter: counter ?? this.counter,
    );

    Persist.save(state);

    return state;
  }
}
