import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inherited_widget/counter/counter.dart';
import 'package:inherited_widget/state/persist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Persist.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Counter(),
      ),
    );
  }
}
