import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/counter/view/wave_view.dart';

import '../counter.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          WaveView(),
          Center(
            child: BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text('$state', style: textTheme.headline2);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_fib_floatingActionButton'),
            child: const Icon(Icons.send),
            onPressed: () async {
              // print('result = ${await fibOnIsolate(45)}');
              await forOnFib(45);
            },
          ),
        ],
      ),
    );
  }
}

/// count number of index in fibonacci sequence
int fib(int i) {
  if (i <= 2) {
    return i;
  } else {
    if (i == 46) throw "NIMEI";
    return fib(i - 1) + fib(i - 2);
  }
}

///
Future<int> forOnFib(int length) async {
  var result = 0;
  for (var i = 0; i < length; i++) {
    result = fib(i);
    print('index = $i result = $result');
  }
  return result;
}

///launch fib on isolate
Future<int> fibOnIsolate(int length) async {
  return await compute(forOnFib, length);
}
