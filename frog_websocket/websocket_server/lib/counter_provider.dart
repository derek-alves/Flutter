import 'package:dart_frog/dart_frog.dart';

import 'package:websocket_server/counter_cubit.dart';

final _counter = CounterCubit();

/// Provides an instance of a [CounterCubit].
final counterProvider = provider<CounterCubit>((_) => _counter);
