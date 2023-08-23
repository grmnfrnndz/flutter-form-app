part of 'counter_bloc_bloc.dart';

class CounterBlocState extends Equatable {

  final int counter;
  final int transactionCount;

  const CounterBlocState({this.counter = 0, this.transactionCount = 0});
  
  @override
  List<Object> get props => [counter, transactionCount];

  CounterBlocState copyWith({int? counter, int? transactionCount}) => CounterBlocState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
}
