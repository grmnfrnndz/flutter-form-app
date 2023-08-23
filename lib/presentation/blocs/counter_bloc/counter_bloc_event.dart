part of 'counter_bloc_bloc.dart';

sealed class CounterBlocEvent {
  const CounterBlocEvent();
}


class CounterIncrease extends CounterBlocEvent {
  final int value;
  const CounterIncrease({required this.value});
}

class CounterReset extends CounterBlocEvent {}