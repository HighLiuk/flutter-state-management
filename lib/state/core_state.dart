class CoreState {
  final int counter;

  const CoreState({
    this.counter = 0,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CoreState &&
            runtimeType == other.runtimeType &&
            counter == other.counter;
  }

  @override
  int get hashCode => counter.hashCode;

  CoreState copy({
    int? counter,
  }) {
    return CoreState(
      counter: counter ?? this.counter,
    );
  }
}
