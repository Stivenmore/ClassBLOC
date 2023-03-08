part of 'counter_bloc.dart';

class CounterState extends Equatable {
  const CounterState({this.value = 0, this.alert = false});

  final int value;
  final bool alert;

  CounterState copyWith({int? value, bool? alert}) {
    return CounterState(value: value ?? this.value, alert: alert ?? this.alert);
  }

  @override
  List<Object> get props => [value, alert];
}
