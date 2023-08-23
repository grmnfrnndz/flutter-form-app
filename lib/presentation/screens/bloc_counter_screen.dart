import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/presentation/blocs/counter_bloc/counter_bloc_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  static String name = 'bloc_counter_screen';

  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBlocBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();


  void increaseCounterBy(BuildContext context, [int value = 1]) {
    // context.read<CounterBlocBloc>()
    // .add(CounterIncrease(value: value));

    context.read<CounterBlocBloc>().increaseBy(value);

  }


  @override
  Widget build(BuildContext context) {

    final counterTransaction = context.read<CounterBlocBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter: ${counterTransaction.transactionCount}'),
        actions: [
          IconButton(
            // onPressed: () => context.read<CounterBlocBloc>().add(CounterReset()), 
            onPressed: () => context.read<CounterBlocBloc>().resetCounter(), 
            icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: context.select((CounterBlocBloc value) {
          // print('changed!!!');
          return Text('Counter value: ${value.state.counter}');
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1', child: const Text('+3'), onPressed: () => increaseCounterBy(context, 3)),
          const SizedBox(
            height: 2,
          ),
          FloatingActionButton(
              heroTag: '2', child: const Text('+2'), onPressed: () => increaseCounterBy(context, 2)),
          const SizedBox(
            height: 2,
          ),
          FloatingActionButton(
              heroTag: '3', child: const Text('+1'), onPressed: () => increaseCounterBy(context)),
        ],
      ),
    );
  }
}
