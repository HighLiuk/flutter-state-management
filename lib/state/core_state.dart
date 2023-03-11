class CoreState {
  final int counter;

  CoreState({
    this.counter = 0,
  });

  CoreState copy({
    int? counter,
  }) =>
      CoreState(
        counter: counter ?? this.counter,
      );
}
