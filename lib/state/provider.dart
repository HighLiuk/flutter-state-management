import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inherited_widget/state/core_state.dart';

final provider = StateNotifierProvider<AppStateNotifier, CoreState>(
  (ref) => AppStateNotifier(),
);

class AppStateNotifier extends StateNotifier<CoreState> {
  AppStateNotifier() : super(CoreState());

  void incrementCounter() {
    state = state.copy(
      counter: state.counter + 1,
    );
  }
}
