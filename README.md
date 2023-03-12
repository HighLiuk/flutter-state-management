# Tutorial

## Riverpod

### Installazione

1. Installa Riverpod

```yaml
# pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.3.1
```

2. Wrappa la tua app con ProviderScope

```dart
// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}
```

### Crea un Provider

1. Crea un model per il tuo stato. Ti conviene creare anche un metodo `copyWith` per rendere più semplice la creazione di nuovi stati.

```dart
// state/app_state.dart

class AppState {
  final int count;

  AppState({
    this.count = 0,
  });

  AppState copyWith({
    int? count,
  }) {
    return AppState(
      count: count ?? this.count,
    );
  }
}
```

2. Crea un provider. Per farlo, dovrai prima di tutto creare uno `StateNotifier` che estende `StateNotifier<T>` dove `T` è il tipo del tuo stato. Lo `StateNotifier` è un oggetto che ti permette di modificare lo stato, e deve essere creato all'interno del provider. I suoi metodi devono modificare lo stato tramite `state = ...`.

```dart
// state/provider.dart

final provider = StateNotifierProvider<AppStateNotifier, AppState>(
  (ref) => AppStateNotifier(),
);

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(AppState());

  void increment() {
    state = state.copyWith(
      count: state.count + 1,
    );
  }
}
```

### Consuma il Provider

1. Ogni volta che vuoi accedere al tuo stato, sia in lettura che in scrittura, il tuo widget deve estendere `ConsumerWidget`.

2. Se vuoi leggere lo stato, puoi usare `ref.watch` su `provider` per ottenere lo stato corrente.

```dart
class MyReadingWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppState state = ref.watch(provider);

    return Text('${state.count}');
  }
}
```

3. Se vuoi modificare lo stato, puoi usare `ref.read` su `provider.notifier` per ottenere lo `StateNotifier` e chiamare il metodo che modifica lo stato.

```dart
class MyWritingWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppStateNotifier notifier = ref.read(provider.notifier);

    return ElevatedButton(
      onPressed: notifier.increment,
      child: const Text('Press Me'),
    );
  }
}
```

## Shared Preferences (Persistenza dati)

### Setup

1. Installa Shared Preferences

```yaml
# pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.0.18
```

2. Crea una classe per la gestione della persistenza

```dart
// state/persist.dart

import 'package:shared_preferences/shared_preferences.dart';

class Persist {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    if (isClear()) {
      await reset();
    }
  }

  static Future<void> reset() async {
    await _prefs.clear();
    await save(AppState());
  }

  static Future<void> save(AppState state) async {
    await _prefs.setInt('counter', state.counter);
  }

  static AppState load() {
    return AppState(
      counter: _prefs.getInt('counter') ?? 0,
    );
  }

  static bool isClear() {
    return !_prefs.containsKey('counter');
  }
}
```

3. Inizializza la tua classe `Persist` prima di eseguire l'app

```dart
// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Persist.init();
  runApp(ProviderScope(child: MyApp()));
}
```

### Persisti lo stato

1. Modifica il tuo provider per caricare lo stato dal file di persistenza

```dart
// state/provider.dart

class AppStateNotifier extends StateNotifier<AppState> {
  // AppStateNotifier() : super(AppState());
  AppStateNotifier() : super(Persist.load());

  void increment() {
    state = state.copyWith(
      count: state.count + 1,
    );
  }
}
```

2. Modifica il metodo `copyWith` del tuo model per salvare lo stato nel file di persistenza ogni volta che viene modificato

```dart
// state/app_state.dart

class AppState {
  AppState copyWith({
    int? count,
  }) {
    final AppState state = AppState(
      count: count ?? this.count,
    );

    Persist.save(state);

    return state;
  }
}
```
