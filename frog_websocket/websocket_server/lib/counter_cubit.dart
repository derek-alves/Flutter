import 'package:broadcast_bloc/broadcast_bloc.dart';

// ignore: public_member_api_docs
class CounterCubit extends BroadcastCubit<int> {
  // Create an instance with an initial state of 0.
  // ignore: public_member_api_docs
  CounterCubit() : super(0);

  // Increment the current state.
  // ignore: public_member_api_docs
  void increment() => emit(state + 1);
}
