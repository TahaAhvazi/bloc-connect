part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({required this.counter});

  factory CounterState.inital() {
    return CounterState(counter: 0);
  }

  @override
  List<Object> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return "CounterState(Counter : $counter)";
  }

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
