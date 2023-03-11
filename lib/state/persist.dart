import 'package:inherited_widget/state/core_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Persist {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    if (isClear()) {
      await reset();
    }
  }

  static Future<void> save(CoreState state) async {
    await _prefs.setInt('counter', state.counter);
  }

  static Future<void> reset() async {
    await _prefs.clear();
    await save(CoreState());
  }

  static CoreState load() {
    return CoreState(
      counter: _prefs.getInt('counter') ?? 0,
    );
  }

  static bool isClear() {
    return !_prefs.containsKey('counter');
  }
}
