import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_connection/blocs/color/color_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int incrementSize = 1;
  final ColorBloc colorBloc;
  late final StreamSubscription colorStreamSubscription;

  CounterBloc({required this.colorBloc}) : super(CounterState.inital()) {
    colorStreamSubscription = colorBloc.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
        add(ChangeCounterEvent());
      } else if (colorState.color == Colors.green) {
        incrementSize = 10;
        add(ChangeCounterEvent());
      } else if (colorState.color == Colors.blue) {
        incrementSize = 100;
        add(ChangeCounterEvent());
      } else if (colorState.color == Colors.black) {
        incrementSize = -100;
        add(ChangeCounterEvent());
      }
    });

    on<ChangeCounterEvent>((event, emit) {
      emit(
        state.copyWith(counter: state.counter + incrementSize),
      );
    });
  }

  @override
  Future<void> close() {
    colorStreamSubscription.cancel();
    return super.close();
  }
}
