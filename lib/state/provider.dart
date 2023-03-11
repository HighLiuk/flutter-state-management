import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inherited_widget/state/core_state.dart';
import 'package:inherited_widget/state/persist.dart';

final provider = StateNotifierProvider<AppStateNotifier, CoreState>(
  (ref) => AppStateNotifier(),
);

class AppStateNotifier extends StateNotifier<CoreState> {
  AppStateNotifier() : super(Persist.load());

  void incrementCounter() {
    state = state.copy(
      counter: state.counter + 1,
    );
  }
}
