import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_events.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  // Events are increase, decrease, and randomize.
  // Initial state of the counter is 0.
  // The state (which is the integer) is changed based on the event.
  // Usually we would have different types of states, but we only have 1 which is the counter state.

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.random:
        Random randomizer = new Random();
        if (randomizer.nextBool() == false) {
          yield state - randomizer.nextInt(2);
        } else
          yield state + randomizer.nextInt(2);
    }
  }
}
