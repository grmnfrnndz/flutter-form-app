import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  
  CounterBlocBloc() : super(const CounterBlocState()) {
    
    on<CounterIncrease>(_onCounterIncrease);
    on<CounterReset>(_onCounterReset);

  }

  void _onCounterIncrease(CounterIncrease event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(counter: state.counter + event.value, transactionCount: state.transactionCount + 1));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(counter: 0));
  }

  void increaseBy([int value = 1]) {
    add(CounterIncrease(value: value));
  }

  void resetCounter() {
    add(CounterReset());
  }

}
