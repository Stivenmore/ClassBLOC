part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterAdd extends CounterEvent {}

class CounterRemove extends CounterEvent {}

class Transaction extends CounterEvent {}
