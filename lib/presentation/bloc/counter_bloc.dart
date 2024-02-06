import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_bloc.freezed.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterEvent>(_onCounterEvent);
  }

  FutureOr _onCounterEvent(CounterEvent event, Emitter<CounterState> emit) {
    return event.map(
      increment: (_) => emit(CounterState(counter: state.counter + 1)),
      decrement: (_) => emit(CounterState(counter: state.counter - 1)),
    );
  }
}
