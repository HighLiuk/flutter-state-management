import 'package:flutter/material.dart';
import 'package:inherited_widget/state/state_inherited_widget.dart';
import 'package:inherited_widget/state/state_widget_state.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  StateWidgetState get state => StateInheritedWidget.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget Demo'),
      ),
      body: Center(
        child: Text(
          '${state.counter}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
