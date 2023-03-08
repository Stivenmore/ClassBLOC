part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUser extends LoginEvent {
  final String value;
  const LoginUser(this.value);

  @override
  List<Object> get props => [value];
}

class LoginPass extends LoginEvent {
  final String value;
  const LoginPass(this.value);

  @override
  List<Object> get props => [value];
}

class LoginSubmit extends LoginEvent {}

class LoginReset extends LoginEvent {}
