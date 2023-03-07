import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterAdd>(_addvalue);
    on<CounterRemove>(_removevalue);
    on<Transaction>(
      (event, emit) {
        emit.forEach(stream, onData: (data) => data);
      },
    );
  }

  void _addvalue(CounterAdd even, Emitter<CounterState> emit) {
    emit(state.copyWith(value: state.value + 1));
  }

  void _removevalue(CounterRemove even, Emitter<CounterState> emit) {
    emit(state.copyWith(value: state.value - 1));
  }
}
