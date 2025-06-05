// import 'package:bloc_counter_app/Bloc/counter_event.dart';
// import 'package:bloc_counter_app/Bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(CounterState(0)) {
//     on<increment>((event, emit) {
//       emit(CounterState(state.counter + 1));
//     });
//     on<decrement>((event, emit) {
//       emit(CounterState(state.counter - 1));
//     });
//   }
// }

// class CounterState {
//   int counter;
//   CounterState(this.counter);
// }

// abstract class CounterEvent {}

// class increment extends CounterEvent {}

// class decrement extends CounterEvent {}

class CounterBloc extends Cubit<int> {
  CounterBloc() : super(0); //setting up initial state

  //creating methods for cubit
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
