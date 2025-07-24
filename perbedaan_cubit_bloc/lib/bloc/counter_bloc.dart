import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perbedaan_cubit_bloc/bloc/counter_event.dart';
import 'package:perbedaan_cubit_bloc/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<IncrementCounter>((event, emit) {
      emit(CounterState(state.count + 1));
    });
    on<DecrementCounter>((event, emit) {
      emit(CounterState(state.count - 1));
    });
  }
}
