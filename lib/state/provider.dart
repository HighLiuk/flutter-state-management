import 'package:flutter/material.dart';
import 'package:inherited_widget/state/core_state.dart';
import 'package:provider/provider.dart';

class StateProvider extends StatelessWidget {
  final Widget child;

  const StateProvider({
    super.key,
    required this.child,
  });

  static CoreState of(BuildContext context) {
    return Provider.of<CoreState>(
      context,
      listen: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CoreState>(
      create: (context) => CoreState(),
      child: child,
    );
  }
}
